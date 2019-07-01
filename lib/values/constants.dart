class Constants {
  static String TEAM_DATA_URL =
      'https://firebasestorage.googleapis.com/v0/b/midevfest.appspot.com/o/team.json?alt=media&token=a38ddead-7b2e-407b-8b70-6b2e1d88c7e8';
  static String SPONSOR_DATA_URL =
      'https://firebasestorage.googleapis.com/v0/b/midevfest.appspot.com/o/partners.json?alt=media&token=d83c4076-f652-4976-b490-6bbb10481105';
  static String CODE_OF_CONDUCT_URL =
      'https://firebasestorage.googleapis.com/v0/b/midevfest.appspot.com/o/code_of_conduct.html?alt=media&token=be87fffa-bf28-4b54-86d8-904bae70408e';
//   static String TEAM_DATA_URL = 'assets/data/team.json';
//   static String SPONSOR_DATA_URL = 'assets/data/partners.json';
// static String CODE_OF_CONDUCT_URL = 'assets/data/code_of_conduct.html';

  static Map<String, String> PAGES = {
    'main': 'main',
    'team': 'team',
    'code': 'code',
    'sponsors': 'sponsors'
  };
}