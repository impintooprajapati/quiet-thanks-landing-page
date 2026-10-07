/** Small, progressively enhanced interactions. Content stays visible without JS. */
(function () {
  const reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)');
  const animations = new Set();

  function animate(element, frames, options) {
    if (!element || reducedMotion.matches || !element.animate) return;
    const animation = element.animate(frames, options);
    animations.add(animation);
    const cleanup = () => animations.delete(animation);
    animation.addEventListener('finish', cleanup, { once: true });
    animation.addEventListener('cancel', cleanup, { once: true });
  }
  reducedMotion.addEventListener('change', () => {
    if (reducedMotion.matches) animations.forEach(animation => animation.cancel());
  });

  function initGallery() {
    const gallery = document.querySelector('[data-screens]');
    if (!gallery || gallery.dataset.initialized) return;
    gallery.dataset.initialized = 'true';
    const screens = JSON.parse(gallery.dataset.screens);
    const tabs = [...gallery.querySelectorAll('.gallery-tab-btn')];
    const panel = gallery.querySelector('.spotlight-stage');
    const content = gallery.querySelector('.spotlight-content');
    const image = gallery.querySelector('.spotlight-phone .phone-screen-img');
    const status = gallery.querySelector('.preview-status');
    let current = 0;
    let requested = 0;
    let version = 0;

    async function select(index) {
      requested = (index + screens.length) % screens.length;
      const next = requested;
      const request = ++version;
      if (next === current) {
        panel.removeAttribute('aria-busy');
        status.textContent = '';
        return;
      }
      const screen = screens[next];
      panel.setAttribute('aria-busy', 'true');
      status.textContent = 'Loading ' + screen.title + ' preview…';
      // Decode first so the phone never flashes an empty frame. Only the latest
      // request may commit, even when images arrive out of order.
      const preload = new Image();
      preload.src = screen.image;
      try {
        await preload.decode();
      } catch (_) {
        if (request !== version) return;
        panel.removeAttribute('aria-busy');
        requested = current;
        status.textContent = 'This preview could not load. Please try again.';
        return;
      }
      if (request !== version) return;
      const direction = next > current ? 1 : -1;
      current = next;
      tabs.forEach((tab, i) => {
        tab.classList.toggle('active', i === current);
        tab.setAttribute('aria-selected', String(i === current));
        tab.tabIndex = i === current ? 0 : -1;
      });
      panel.setAttribute('aria-labelledby', tabs[current].id);
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
      image.src = screen.image;
      image.alt = 'Quiet Thanks — ' + screen.title;
      panel.removeAttribute('aria-busy');
      status.textContent = `${screen.title}, screen ${current + 1} of ${screens.length}`;
      [image, content].forEach(element => element.getAnimations?.().forEach(animation => animation.cancel()));
      animate(image, [
        { opacity: .35, transform: `translateX(${direction * 12}px)` },
        { opacity: 1, transform: 'translateX(0)' },
      ], { duration: 320, easing: 'cubic-bezier(.2,.7,.2,1)' });
      animate(content, [
        { opacity: .65, transform: 'translateY(6px)' },
        { opacity: 1, transform: 'translateY(0)' },
      ], { duration: 280, easing: 'ease-out' });
    }
    tabs.forEach((tab, i) => {
      tab.addEventListener('click', () => select(i));
      tab.addEventListener('keydown', event => {
        let next;
        if (event.key === 'ArrowRight') next = (i + 1) % tabs.length;
        else if (event.key === 'ArrowLeft') next = (i - 1 + tabs.length) % tabs.length;
        else if (event.key === 'Home') next = 0;
        else if (event.key === 'End') next = tabs.length - 1;
        else return;
        event.preventDefault();
        tabs[next].focus({ preventScroll: true });
        select(next);
      });
    });
    const arrows = gallery.querySelectorAll('.spotlight-nav-arrow');
    arrows[0].addEventListener('click', () => select(requested - 1));
    arrows[1].addEventListener('click', () => select(requested + 1));
  }

  function initMobileMenu() {
    const toggle = document.querySelector('.mobile-menu-btn');
    const drawer = document.querySelector('.mobile-drawer');
    if (!toggle || !drawer || toggle.dataset.initialized) return;
    toggle.dataset.initialized = 'true';
    function setOpen(open) {
      drawer.inert = !open;
      drawer.classList.toggle('open', open);
      toggle.setAttribute('aria-expanded', String(open));
      toggle.setAttribute('aria-label', open ? 'Close navigation' : 'Open navigation');
    }
    setOpen(false);
    toggle.addEventListener('click', () => setOpen(toggle.getAttribute('aria-expanded') !== 'true'));
    drawer.querySelectorAll('a').forEach(link => link.addEventListener('click', () => {
      setOpen(false);
      const target = document.querySelector(link.hash || '#main-content');
      if (target) {
        target.setAttribute('tabindex', '-1');
        target.focus({ preventScroll: true });
      }
    }));
    document.addEventListener('keydown', event => {
      if (event.key === 'Escape' && toggle.getAttribute('aria-expanded') === 'true') {
        setOpen(false);
        toggle.focus();
      }
    });
    document.addEventListener('click', event => {
      if (!drawer.contains(event.target) && !toggle.contains(event.target)) setOpen(false);
    });
    drawer.addEventListener('focusout', () => {
      requestAnimationFrame(() => {
        if (!drawer.contains(document.activeElement) && document.activeElement !== toggle) setOpen(false);
      });
    });
    const desktop = window.matchMedia('(min-width: 861px)');
    desktop.addEventListener('change', event => { if (event.matches) setOpen(false); });
  }

  function initNavigation() {
    const header = document.querySelector('.navbar-wrapper');
    if (!header) return;
    const links = [...header.querySelectorAll('.nav-link')];
    const sections = [...document.querySelectorAll('main > section[id]')];
    let queued = false;
    function update() {
      queued = false;
      const edge = header.getBoundingClientRect().height + 100;
      let active = '';
      sections.forEach(section => {
        if (section.getBoundingClientRect().top <= edge) active = '#' + section.id;
      });
      links.forEach(link => {
        if (link.hash === active) link.setAttribute('aria-current', 'location');
        else link.removeAttribute('aria-current');
      });
      header.classList.toggle('is-scrolled', window.scrollY > 20);
    }
    function schedule() {
      if (!queued) { queued = true; requestAnimationFrame(update); }
    }
    window.addEventListener('scroll', schedule, { passive: true });
    window.addEventListener('resize', schedule, { passive: true });
    update();
  }

  function initMotion() {
    if ('IntersectionObserver' in window) {
      const observer = new IntersectionObserver(entries => {
        entries.forEach(entry => {
          if (!entry.isIntersecting) return;
          observer.unobserve(entry.target);
          // Animate only on entry, never hide content while waiting for JS.
          animate(entry.target, [
            { opacity: .55, transform: 'translateY(16px)' },
            { opacity: 1, transform: 'translateY(0)' },
          ], { duration: 560, easing: 'cubic-bezier(.2,.7,.2,1)' });
        });
      }, { threshold: .12 });
      document.querySelectorAll('.section-header, .feature-card, .step-card, .privacy-intro-box, .privacy-grid, .faq-intro, .faq-list, .cta-box').forEach(element => observer.observe(element));
    }
    document.querySelectorAll('.faq-item').forEach(item => {
      item.addEventListener('toggle', () => {
        if (item.open) animate(item.querySelector('p'), [
          { opacity: .4, transform: 'translateY(-5px)' },
          { opacity: 1, transform: 'translateY(0)' },
        ], { duration: 230, easing: 'ease-out' });
      });
    });
  }

  function init() {
    initGallery();
    initMobileMenu();
    initNavigation();
    initMotion();
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
