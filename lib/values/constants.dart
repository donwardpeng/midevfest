class Constants {
  //Firebase Cloud Storage Info
  static String DEVFEST_BUCKET = 'midevfest';

  //Flag to read from local json files vs Firebase Cloud Storage
  static bool readJsonDataLocally = false; 

  //Relative Paths to json files in Firebase Cloud Storage
  static String TEAM_DATA_URL = readJsonDataLocally ? 'assets/data/team.json': 'team.json';
  static String SPONSOR_DATA_URL = readJsonDataLocally ? 'assets/data/partners.json':'partners.json';
  static String SPEAKERS_DATA_URL = readJsonDataLocally ? 'assets/data/speakers.json': 'speakers.json';
  static String SESSIONS_DATA_URL = readJsonDataLocally ? 'assets/data/sessions.json' : 'sessions.json';
  static String SCHEDULE_DATA_URL = readJsonDataLocally ? 'assets/data/schedule.json' : 'schedule.json';

  //Absolute Paths to json files in Firebase Cloud Storage
  static String CODE_OF_CONDUCT_URL =
      'https://firebasestorage.googleapis.com/v0/b/midevfest.appspot.com/o/code_of_conduct.html?alt=media';

  //A list of pages
  static Map<String, String> PAGES = {
    'main': 'main',
    'team': 'team',
    'code': 'code',
    'sponsors': 'sponsors'
  };
}
