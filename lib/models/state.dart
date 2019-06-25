import 'team.dart';
import 'sponsor_list.dart';

class StateModel {
  String currentPage;
  Team currentTeam;
  SponsorList sponsorList;
  
  StateModel({
    this.currentPage = '',
  });
}