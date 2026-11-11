class AppConstants {
  // Freshness thresholds (minutes)
  static const int freshMinutesThreshold = 15;
  static const int agingMinutesThreshold = 45;
  static const int staleMinutesCutoff = 60;

  // Ranking load penalties
  static const double loadPenaltyLow = 0.0;
  static const double loadPenaltyMed = 5.0;
  static const double loadPenaltyHigh = 12.0;

  // Distance & Routing constants
  static const double cityAverageSpeedKmH = 25.0; // Fallback city speed
  static const int osrmTimeoutSeconds = 3;

  // Offer Countdown
  static const int offerDurationSeconds = 120; // 2 minutes

  // Default Map center (Mumbai Bandra/BKC)
  static const double defaultLat = 19.0600;
  static const double defaultLng = 72.8700;

  // Bed Types supported
  static const List<String> bedTypes = [
    'ICU',
    'Ventilator',
    'Oxygen',
    'Cardiac',
    'Burns',
    'General',
  ];

  // AI OpenRouter API Key (Pass at build time via --dart-define=OPENROUTER_API_KEY=...)
  static const String openRouterApiKey = String.fromEnvironment(
    'OPENROUTER_API_KEY',
    defaultValue: '',
  );
  static const String openRouterModel = 'google/gemini-2.5-flash-lite';
}
