import 'team.dart';
import 'sponsor_list.dart';

class StateModel {
  String currentPage;
  Team currentTeam;
  SponsorList sponsorList;
  
static Map<String, String> PAGES = {'main': 'main', 'team': 'team'};

  StateModel({
    this.currentPage = '',
  });
}