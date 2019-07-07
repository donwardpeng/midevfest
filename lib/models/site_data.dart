import 'sponsor_list.dart';
import 'team.dart';
import 'speakers.dart';
import 'sessions.dart';
import 'schedule.dart';

class SiteData{
  Team theTeam;
  SponsorList theSponsors;
  Speakers theSpeakers;
  Sessions theSessions;
  Schedule theSchedule;

  SiteData({this.theTeam, this.theSponsors, this.theSpeakers, this.theSessions, this.theSchedule}); 

}