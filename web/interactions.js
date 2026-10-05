/** Progressive enhancement for the statically rendered landing page. */
(function () {
  function init() {
    const gallery = document.querySelector('[data-screens]');
    if (gallery && !gallery.dataset.initialized) {
      gallery.dataset.initialized = 'true';
      const screens = JSON.parse(gallery.dataset.screens);
      const tabs = gallery.querySelectorAll('.gallery-tab-btn');
      let current = 0;
      function select(index) {
        current = (index + screens.length) % screens.length;
        const screen = screens[current];
        tabs.forEach((tab, i) => {
          tab.classList.toggle('active', i === current);
          tab.setAttribute('aria-pressed', String(i === current));
        });
        const copy = {
          '.spotlight-badge span': screen.tag,
          '.spotlight-title': screen.title,
          '.spotlight-headline': screen.headline,
          '.spotlight-desc': screen.description,
          '.spotlight-step-counter': `0${current + 1} / 0${screens.length}`,
        };
        Object.entries(copy).forEach(([selector, text]) => {
          gallery.querySelector(selector).textContent = text;
        });
        gallery.querySelectorAll('.spotlight-bullet-text').forEach((item, i) => {
          item.textContent = screen.bullets[i];
        });
        const img = gallery.querySelector('.spotlight-phone .phone-screen-img');
        img.src = screen.image;
        img.alt = 'Quiet Thanks — ' + screen.title;
      }
      tabs.forEach((tab, i) => tab.addEventListener('click', () => select(i)));
      const arrows = gallery.querySelectorAll('.spotlight-nav-arrow');
      arrows[0].addEventListener('click', () => select(current - 1));
      arrows[1].addEventListener('click', () => select(current + 1));
    }

    const toggle = document.querySelector('.mobile-menu-btn');
    const drawer = document.querySelector('.mobile-drawer');
    if (toggle && drawer && !toggle.dataset.initialized) {
      toggle.dataset.initialized = 'true';
      function setOpen(open) {
        drawer.classList.toggle('open', open);
        toggle.setAttribute('aria-expanded', String(open));
        toggle.setAttribute('aria-label', open ? 'Close navigation' : 'Open navigation');
      }
      toggle.addEventListener('click', () => setOpen(toggle.getAttribute('aria-expanded') !== 'true'));
      drawer.querySelectorAll('a').forEach(link => link.addEventListener('click', () => setOpen(false)));
      document.addEventListener('keydown', event => {
        if (event.key === 'Escape' && toggle.getAttribute('aria-expanded') === 'true') {
          setOpen(false);
          toggle.focus();
        }
      });
      document.addEventListener('click', event => {
        if (!drawer.contains(event.target) && !toggle.contains(event.target)) setOpen(false);
      });
      const desktop = window.matchMedia('(min-width: 861px)');
      desktop.addEventListener('change', event => { if (event.matches) setOpen(false); });
    }
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
