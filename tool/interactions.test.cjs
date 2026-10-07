// Focused regression checks for asynchronous preview selection and reduced motion.
const { test } = require('node:test');
const assert = require('node:assert/strict');
const { readFileSync } = require('node:fs');
const vm = require('node:vm');
const source = readFileSync(new URL('../web/interactions.js', `file://${__filename}`), 'utf8');

function setup(reduce = false) {
  const pending = [];
  const motion = [];
  const media = { matches: reduce, addEventListener(_, callback) { this.change = callback; } };
  function element(id = '') {
    return {
      id, attrs: {}, listeners: {}, dataset: {}, textContent: '',
      classList: { toggle() {} },
      setAttribute(key, value) { this.attrs[key] = value; },
      removeAttribute(key) { delete this.attrs[key]; },
      addEventListener(name, callback) { this.listeners[name] = callback; },
      focus() { this.focused = true; },
      getAnimations() { return []; },
      animate() {
        const animation = { cancelled: false, addEventListener() {}, cancel() { this.cancelled = true; } };
        motion.push(animation);
        return animation;
      },
    };
  }
  const screens = ['Daily', 'Mood', 'Calendar', 'Insights', 'Privacy'].map((title, i) => ({
    title, tag: title, headline: title, description: title, image: `${i}.webp`, bullets: ['a', 'b', 'c'],
  }));
  const tabs = screens.map((_, i) => element(`screen-tab-${i}`));
  const arrows = [element(), element()];
  const bullets = [element(), element(), element()];
  const nodes = Object.fromEntries([
    '.spotlight-stage', '.spotlight-content', '.spotlight-phone .phone-screen-img', '.preview-status',
    '.spotlight-badge span', '.spotlight-title', '.spotlight-headline', '.spotlight-desc', '.spotlight-step-counter',
  ].map(key => [key, element()]));
  const gallery = element();
  gallery.dataset.screens = JSON.stringify(screens);
  gallery.querySelector = key => nodes[key];
  gallery.querySelectorAll = key => ({'.gallery-tab-btn': tabs, '.spotlight-nav-arrow': arrows, '.spotlight-bullet-text': bullets}[key]);
  const document = {
    readyState: 'complete',
    querySelector: key => key === '[data-screens]' ? gallery : null,
    querySelectorAll: () => [],
  };
  class Image {
    decode() { return new Promise((resolve, reject) => pending.push({ resolve, reject, src: this.src })); }
  }
  vm.runInNewContext(source, { window: { matchMedia: () => media }, document, Image });
  return { tabs, arrows, nodes, pending, motion, media };
}
const flush = () => new Promise(resolve => setImmediate(resolve));

test('rapid selection commits only the latest decoded image and matching text', async () => {
  const app = setup();
  app.tabs[1].listeners.click();
  app.tabs[2].listeners.click();
  app.pending[1].resolve();
  await flush();
  app.pending[0].resolve();
  await flush();
  assert.equal(app.nodes['.spotlight-title'].textContent, 'Calendar');
  assert.equal(app.nodes['.spotlight-phone .phone-screen-img'].src, '2.webp');
  assert.equal(app.tabs[2].attrs['aria-selected'], 'true');
  assert.equal(app.tabs[1].tabIndex, -1);
  assert.equal(app.nodes['.spotlight-stage'].attrs['aria-labelledby'], 'screen-tab-2');
});

test('selecting the current screen cancels an in-flight request', async () => {
  const app = setup();
  app.tabs[1].listeners.click();
  app.tabs[0].listeners.click();
  app.pending[0].resolve();
  await flush();
  assert.equal(app.nodes['.spotlight-title'].textContent, ''); // static content remains untouched
  assert.equal(app.nodes['.spotlight-stage'].attrs['aria-busy'], undefined);
});

test('image failure retains the old preview and announces a retry', async () => {
  const app = setup();
  app.tabs[1].listeners.click();
  app.pending[0].reject(new Error('offline'));
  await flush();
  assert.match(app.nodes['.preview-status'].textContent, /try again/);
  assert.equal(app.nodes['.spotlight-stage'].attrs['aria-busy'], undefined);
  app.arrows[1].listeners.click();
  assert.equal(app.pending[1].src, '1.webp');
});

test('keyboard navigation wraps and reduced motion avoids all preview animation', async () => {
  const app = setup(true);
  let prevented = false;
  app.tabs[0].listeners.keydown({key: 'ArrowLeft', preventDefault() { prevented = true; }});
  app.pending[0].resolve();
  await flush();
  assert.ok(prevented);
  assert.ok(app.tabs[4].focused);
  assert.equal(app.nodes['.spotlight-title'].textContent, 'Privacy');
  assert.equal(app.motion.length, 0);
});

test('a motion preference change cancels running animations', async () => {
  const app = setup();
  app.tabs[1].listeners.click();
  app.pending[0].resolve();
  await flush();
  assert.equal(app.motion.length, 2);
  app.media.matches = true;
  app.media.change();
  assert.ok(app.motion.every(animation => animation.cancelled));
});
