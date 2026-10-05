class AppStrings {
  AppStrings._();

  static const String appName = 'Quiet Thanks';
  static const String tagline =
      'Focus on the good. One quiet moment at a time.';
  static const String appDescription =
      'A private daily gratitude journal designed to help users notice and appreciate the good moments in their lives.';

  static const String playStoreUrl =
      'https://play.google.com/store/apps/details?id=com.app.quietthanks';
  static const String privacyPolicyUrl = 'privacy';
  static const String supportEmail = 'iampintooprajapati@gmail.com';
  static const String supportMailto = 'mailto:iampintooprajapati@gmail.com';
  static const String authorName = 'Pintoo Prajapati';
  static const String authorUrl = 'https://impintooprajapati.in/';

  // Navigation
  static const String navFeatures = 'Features';
  static const String navPrivacy = 'Privacy';
  static const String navHowItWorks = 'How It Works';
  static const String navScreenshots = 'App Preview';
  static const String navGetApp = 'Get the App';

  // Hero Section
  static const String heroBadge = 'Private by nature. Offline by design.';
  static const String heroTitleLine1 = 'Focus on the good.';
  static const String heroTitleLine2 = 'One quiet moment at a time.';
  static const String heroSubtitle =
      'Notice the little things. Save the moments that matter. A private gratitude journal, with a little space just for you.';
  static const String ctaGetQuietThanks = 'Get it on Google Play';
  static const String ctaLearnMore = 'Take a look inside';

  // Problem / Introduction
  static const String problemHeading = 'Make space for the good things.';
  static const String problemText =
      'Life moves quickly. Quiet Thanks gives you a simple place to pause, appreciate the little things, and record moments that matter.';

  // Features
  static const String featuresTag = 'Intentional Design';
  static const String featuresHeading = 'Small rituals. Meaningful days.';

  static const List<Map<String, String>> featuresList = [
    {
      'title': 'Daily Gratitude',
      'desc':
          'Write up to three meaningful moments each day and build a simple gratitude habit.',
      'icon': 'gratitude',
    },
    {
      'title': 'Capture Memories',
      'desc':
          'Add photos to preserve the memories behind your gratitude entries.',
      'icon': 'camera',
    },
    {
      'title': 'Track Your Mood',
      'desc':
          'Record how you feel and discover patterns in your emotional journey.',
      'icon': 'mood',
    },
    {
      'title': 'Private Voice-to-Text',
      'desc':
          'Speak naturally and turn your thoughts into journal entries using on-device voice-to-text.',
      'icon': 'mic',
    },
    {
      'title': 'Calendar & Streaks',
      'desc':
          'See your journey through a beautiful calendar and keep your gratitude streak alive.',
      'icon': 'calendar',
    },
    {
      'title': 'Simple Insights',
      'desc':
          'Explore writing activity, mood patterns, and your personal journey over time.',
      'icon': 'insights',
    },
  ];

  // Privacy
  static const String privacyTag = 'Yours, and yours alone';
  static const String privacyHeading = 'Your thoughts belong to you.';
  static const String privacySubheading =
      "Privacy isn't a feature. It's the foundation.";
  static const String privacyDescription =
      'Quiet Thanks is designed around privacy from the ground up. Your journal works completely offline and your personal thoughts stay on your device.';

  static const List<String> privacyPoints = [
    'No account required',
    'No ads',
    'No tracking',
    'No data collection',
    'Offline-first',
    'Encrypted local storage',
    'Passcode protection',
    'Export & backup whenever you choose',
  ];

  // How It Works
  static const String howItWorksTag = 'Mindful Routine';
  static const String howItWorksHeading =
      'A quiet habit in three simple steps.';

  static const List<Map<String, String>> steps = [
    {
      'step': 'Step 01',
      'title': 'Write',
      'desc': "Capture something you're grateful for.",
    },
    {
      'step': 'Step 02',
      'title': 'Reflect',
      'desc': 'Add your mood, a photo, or simply write a few words.',
    },
    {
      'step': 'Step 03',
      'title': 'Grow',
      'desc':
          'Build your streak and look back at the moments that made your days better.',
    },
  ];

  // App Screenshots
  static const String screenshotsTag = 'A look inside';
  static const String screenshotsHeading = 'A calm space for your thoughts.';

  static const List<Map<String, dynamic>> screenshots = [
    {
      'id': 'daily',
      'tag': 'Screen 01 · Intentional Practice',
      'title': 'Daily Entries',
      'subtitle': 'Pause and log 3 meaningful moments',
      'headline': 'Three moments to ground your day.',
      'description':
          'Quiet Thanks encourages you to write up to three moments of gratitude each day. By capping entries at three, it eliminates journaling fatigue and turns appreciation into a calm, effortless habit.',
      'image': 'images/screen-daily.webp',
      'bullets': [
        '3-Note Limit to keep journaling intentional & stress-free',
        'Daily reflection prompts when you need gentle inspiration',
        'Quick time stamps and mood badges for easy recall',
      ],
    },
    {
      'id': 'mood',
      'tag': 'Screen 02 · Mindful Reflection',
      'title': 'Mood Tracking',
      'subtitle': 'Voice notes, photos & emotional state',
      'headline': 'Express how you truly feel.',
      'description':
          'Pair every note with one of five emotional states. Attach memorable photos and capture spontaneous gratitude on the go using private, on-device voice-to-text without internet access.',
      'image': 'images/screen-mood.webp',
      'bullets': [
        '5 nuanced emotion states from Awesome to Awful',
        'Private voice-to-text with zero audio sent to the cloud',
        'Photo attachments to preserve visual memories',
      ],
    },
    {
      'id': 'calendar',
      'tag': 'Screen 03 · Visual Journey',
      'title': 'Calendar',
      'subtitle': 'Reflect on past entries and dates',
      'headline': 'Your personal history at a glance.',
      'description':
          'Browse through past weeks and months with a clean, peaceful calendar view. Green indicators show days with completed notes so you can revisit your happiest memories.',
      'image': 'images/screen-calendar.webp',
      'bullets': [
        'Clean monthly view with day-by-day entry indicators',
        'Tap any past date to read your exact entries and mood',
        'Zero pressure or guilt streaks — reflect at your own pace',
      ],
    },
    {
      'id': 'insights',
      'tag': 'Screen 04 · Emotional Growth',
      'title': 'Insights',
      'subtitle': 'Streaks, frequency & mood patterns',
      'headline': 'Notice patterns in your happiness.',
      'description':
          'Understand your journaling consistency and emotional journey over time. Track active streaks, monthly totals, and view a serene weekly activity chart completely computed on-device.',
      'image': 'images/screen-insights.webp',
      'bullets': [
        'Current & best streak tracking to celebrate milestones',
        'Weekly gratitude cadence curves and entry counts',
        'Total notes and monthly reflection overview',
      ],
    },
    {
      'id': 'privacy',
      'tag': 'Screen 05 · Complete Security',
      'title': 'Privacy',
      'subtitle': 'Passcode lock & local encrypted backup',
      'headline': 'Your thoughts stay yours alone.',
      'description':
          'Your journal is fortified with on-device passcode protection, encrypted local storage, and instant export/import tools. No accounts, no servers, and no tracking — ever.',
      'image': 'images/screen-privacy.webp',
      'bullets': [
        'Biometric & 4-digit passcode lock for maximum privacy',
        'One-tap local data export and full restore capability',
        '100% offline — zero trackers, telemetry, or cloud leakage',
      ],
    },
  ];

  // Privacy Highlight / Quote
  static const String quoteStatement =
      '“Your thoughts belong to you — and only you.”';
  static const List<String> quoteSubpoints = [
    'No cloud account.',
    'No tracking.',
    'No distractions.',
    'Just a quiet place for gratitude.',
  ];

  static const List<Map<String, String>> faqs = [
    {
      'question': 'What is Quiet Thanks?',
      'answer':
          'Quiet Thanks is a private daily gratitude journal for Android. Save up to three meaningful moments each day, add photos, track your mood, and look back on your entries.',
    },
    {
      'question': 'Does the journal work without internet?',
      'answer':
          'Yes. Your journal works offline and stores your entries on your device. You do not need an account to write, reflect, or revisit your memories.',
    },
    {
      'question': 'Who can see my journal entries?',
      'answer':
          'Your entries stay on your device in encrypted local storage. You can protect your journal with a passcode. Quiet Thanks does not collect your journal entries or upload them to its servers.',
    },
    {
      'question': 'Can I back up or move my journal?',
      'answer':
          'Yes. You can export your journal and choose where to save the backup, then import it when you need to restore your entries. Keep a backup before changing phones or uninstalling the app.',
    },
    {
      'question': 'What if I miss a day?',
      'answer':
          'You can return whenever you like. Your past entries are there to revisit, and your next entry can be as simple as one small thing you appreciated today.',
    },
  ];

  // Final CTA
  static const String finalCtaHeading = 'Start your quiet daily practice.';
  static const String finalCtaText =
      'Take a moment for yourself. Notice the good. Keep it close.';

  // Footer
  static const String copyright = '© 2026 Quiet Thanks. All rights reserved.';
}
