import 'team.dart';

class StateModel {
  String currentPage;
  Team currentTeam;
  
static Map<String, String> PAGES = {'main': 'main', 'team': 'team'};

  StateModel({
    this.currentPage = '',
  });
}