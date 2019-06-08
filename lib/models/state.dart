
class StateModel {
  String currentPage;

static Map<String, String> PAGES = {'main': 'main', 'team': 'team'};

  StateModel({
    this.currentPage = '',
  });
}