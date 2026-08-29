/**
 * Quiet Thanks — Production Interactive Script
 * Instant, smooth switching for the App Preview Spotlight & Mobile Drawer
 */

(function () {
  const SCREENS = [
    {
      id: 'daily',
      tag: 'Screen 01 · Intentional Practice',
      title: 'Daily Entries',
      subtitle: 'Pause and log 3 meaningful moments',
      headline: 'Three moments to ground your day.',
      description:
          'Quiet Thanks encourages you to write up to three moments of gratitude each day. By capping entries at three, it eliminates journaling fatigue and turns appreciation into a calm, effortless habit.',
      image: 'images/screen-daily.png',
      bullets: [
        '3-Note Limit to keep journaling intentional & stress-free',
        'Daily reflection prompts when you need gentle inspiration',
        'Quick time stamps and mood badges for easy recall',
      ],
    },
    {
      id: 'mood',
      tag: 'Screen 02 · Mindful Reflection',
      title: 'Mood Tracking',
      subtitle: 'Voice notes, photos & emotional state',
      headline: 'Express how you truly feel.',
      description:
          'Pair every note with one of five emotional states. Attach memorable photos and capture spontaneous gratitude on the go using private, on-device voice-to-text without internet access.',
      image: 'images/screen-mood.png',
      bullets: [
        '5 nuanced emotion states from Awesome to Awful',
        'Private voice-to-text with zero audio sent to the cloud',
        'Photo attachments to preserve visual memories',
      ],
    },
    {
      id: 'calendar',
      tag: 'Screen 03 · Visual Journey',
      title: 'Calendar',
      subtitle: 'Reflect on past entries and dates',
      headline: 'Your personal history at a glance.',
      description:
          'Browse through past weeks and months with a clean, peaceful calendar view. Green indicators show days with completed notes so you can revisit your happiest memories.',
      image: 'images/screen-calendar.png',
      bullets: [
        'Clean monthly view with day-by-day entry indicators',
        'Tap any past date to read your exact entries and mood',
        'Zero pressure or guilt streaks — reflect at your own pace',
      ],
    },
    {
      id: 'insights',
      tag: 'Screen 04 · Emotional Growth',
      title: 'Insights',
      subtitle: 'Streaks, frequency & mood patterns',
      headline: 'Notice patterns in your happiness.',
      description:
          'Understand your journaling consistency and emotional journey over time. Track active streaks, monthly totals, and view a serene weekly activity chart completely computed on-device.',
      image: 'images/screen-insights.png',
      bullets: [
        'Current & best streak tracking to celebrate milestones',
        'Weekly gratitude cadence curves and entry counts',
        'Total notes and monthly reflection overview',
      ],
    },
    {
      id: 'privacy',
      tag: 'Screen 05 · Complete Security',
      title: 'Privacy',
      subtitle: 'Passcode lock & local encrypted backup',
      headline: 'Your thoughts stay yours alone.',
      description:
          'Your journal is fortified with on-device passcode protection, encrypted local storage, and instant export/import tools. No accounts, no servers, and no tracking — ever.',
      image: 'images/screen-privacy.png',
      bullets: [
        'Biometric & 4-digit passcode lock for maximum privacy',
        'One-tap local data export and full restore capability',
        '100% offline — zero trackers, telemetry, or cloud leakage',
      ],
    },
  ];

  let currentIndex = 0;

  function initAppPreview() {
    const tabs = document.querySelectorAll('.gallery-tab-btn');
    const filmstripCards = document.querySelectorAll('.filmstrip-card');
    const spotlightPhoneImg = document.querySelector('.spotlight-phone .phone-screen-img');
    const badgeText = document.querySelector('.spotlight-badge span');
    const titleEl = document.querySelector('.spotlight-title');
    const headlineEl = document.querySelector('.spotlight-headline');
    const descEl = document.querySelector('.spotlight-desc');
    const bulletsContainer = document.querySelector('.spotlight-bullets');
    const counterEl = document.querySelector('.spotlight-step-counter');
    const arrowButtons = document.querySelectorAll('.spotlight-nav-arrow');

    if (!tabs.length && !filmstripCards.length) return;

    function renderScreen(index) {
      if (index < 0 || index >= SCREENS.length) return;
      currentIndex = index;
      const data = SCREENS[index];

      // Update tabs active state
      tabs.forEach((tab, i) => {
        if (i === index) {
          tab.classList.add('active');
        } else {
          tab.classList.remove('active');
        }
      });

      // Update filmstrip cards active state
      filmstripCards.forEach((card, i) => {
        if (i === index) {
          card.classList.add('active');
        } else {
          card.classList.remove('active');
        }
      });

      // Smooth fade transition for the phone screen
      if (spotlightPhoneImg) {
        spotlightPhoneImg.style.transition = 'opacity 0.22s ease, transform 0.22s ease';
        spotlightPhoneImg.style.opacity = '0.3';
        spotlightPhoneImg.style.transform = 'scale(0.97)';
        setTimeout(() => {
          spotlightPhoneImg.src = data.image;
          spotlightPhoneImg.alt = 'Quiet Thanks - ' + data.title;
          spotlightPhoneImg.style.opacity = '1';
          spotlightPhoneImg.style.transform = 'scale(1)';
        }, 120);
      }

      // Update narrative copy
      if (badgeText) badgeText.textContent = data.tag;
      if (titleEl) titleEl.textContent = data.title;
      if (headlineEl) headlineEl.textContent = data.headline;
      if (descEl) descEl.textContent = data.description;
      if (counterEl) counterEl.textContent = `0${index + 1} / 0${SCREENS.length}`;

      // Update bullets
      if (bulletsContainer) {
        bulletsContainer.innerHTML = '';
        data.bullets.forEach((b) => {
          const item = document.createElement('div');
          item.className = 'spotlight-bullet-item';
          item.innerHTML = `
            <div class="spotlight-bullet-icon">
              <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
            </div>
            <span class="spotlight-bullet-text">${b}</span>
          `;
          bulletsContainer.appendChild(item);
        });
      }
    }

    // Attach click listeners to category tabs
    tabs.forEach((tab, index) => {
      tab.addEventListener('click', (e) => {
        e.preventDefault();
        renderScreen(index);
      });
    });

    // Attach click listeners to filmstrip cards
    filmstripCards.forEach((card, index) => {
      card.addEventListener('click', (e) => {
        e.preventDefault();
        renderScreen(index);
      });
    });

    // Attach click listeners to prev/next arrows
    if (arrowButtons.length >= 2) {
      arrowButtons[0].addEventListener('click', (e) => {
        e.preventDefault();
        const prev = (currentIndex - 1 + SCREENS.length) % SCREENS.length;
        renderScreen(prev);
      });
      arrowButtons[1].addEventListener('click', (e) => {
        e.preventDefault();
        const next = (currentIndex + 1) % SCREENS.length;
        renderScreen(next);
      });
    }
  }

  function initMobileMenu() {
    const menuBtn = document.querySelector('.mobile-menu-btn');
    const drawer = document.querySelector('.mobile-drawer');
    if (!menuBtn || !drawer) return;

    menuBtn.addEventListener('click', (e) => {
      e.preventDefault();
      drawer.classList.toggle('open');
    });

    drawer.querySelectorAll('a').forEach((link) => {
      link.addEventListener('click', () => {
        drawer.classList.remove('open');
      });
    });
  }

  // Run on DOMContentLoaded or immediately if already loaded
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
      initAppPreview();
      initMobileMenu();
    });
  } else {
    initAppPreview();
    initMobileMenu();
  }

  // Also support dynamic re-initialization if needed
  window.initQuietThanksInteractions = function () {
    initAppPreview();
    initMobileMenu();
  };
})();
