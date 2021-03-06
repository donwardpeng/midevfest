import 'package:flutter_web/material.dart';
import 'package:midevfest/models/schedule.dart' as midevfestschedule;
import 'theme.dart';
import './config_values/en_strings.dart';
import './ui/main_page.dart';
import './widgets/state_widget.dart';
import './models/team.dart';
import './models/sponsor_list.dart';
import './models/site_data.dart';
import './models/speakers.dart';
import './models/sessions.dart';
import './models/session.dart';
import './models/speaker.dart';
import './models/timeslot.dart';

import 'dart:convert';
import 'dart:html';
import './values/constants.dart';
import './helper/firebase_cloud_storage_resolver.dart';

void main() {
  runApp(StateWidget(
      child: FutureBuilder<SiteData>(
    future: readFromJson(),
    builder: (BuildContext context, AsyncSnapshot<SiteData> snapshot) {
      print('Snapshot hasData? -> ' + snapshot.hasData.toString());

      return snapshot.hasData
          ? MyApp(theData: snapshot.data)
          : Container(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    // OutlineButton(child:Text('Loading'), onPressed: (){})
                  ]),
            );
    },
  )));
}

Future<SiteData> readFromJson() async {
  Team team;
  SponsorList sponsors;
  Speakers speakers;
  Sessions sessions;
  midevfestschedule.Schedule schedule;

  print('parsing team info');
  var path = FirebaseCloudStorageURLResolver()
      .getCloudStorageURL(Constants.DEVFEST_BUCKET, Constants.TEAM_DATA_URL);
  await HttpRequest.getString(path).then((result) {
    var resultFromJson = jsonDecode(result);
    team = Team.fromJson(resultFromJson);
  });
  print('parsing sponsor info');
  var sponsorPath = FirebaseCloudStorageURLResolver()
      .getCloudStorageURL(Constants.DEVFEST_BUCKET, Constants.SPONSOR_DATA_URL);
  await HttpRequest.getString(sponsorPath).then((resultSponsor) {
    var resultFromJson = jsonDecode(resultSponsor);
    sponsors = SponsorList.fromJson(resultFromJson);
  });
  print('parsing speakers info');
  var speakersPath = FirebaseCloudStorageURLResolver().getCloudStorageURL(
      Constants.DEVFEST_BUCKET, Constants.SPEAKERS_DATA_URL);
  await HttpRequest.getString(speakersPath).then((resultSpeakers) {
    var resultFromJson = jsonDecode(resultSpeakers);
    speakers = Speakers.fromJson(resultFromJson);
  });
  print('parsing sessions info');
  var sessionsPath = FirebaseCloudStorageURLResolver().getCloudStorageURL(
      Constants.DEVFEST_BUCKET, Constants.SESSIONS_DATA_URL);
  await HttpRequest.getString(sessionsPath).then((resultSessions) {
    var resultFromJson = jsonDecode(resultSessions);
    sessions = Sessions.fromJson(resultFromJson);
  });
  print('parsing schedule info');
  var schedulePath = FirebaseCloudStorageURLResolver().getCloudStorageURL(
      Constants.DEVFEST_BUCKET, Constants.SCHEDULE_DATA_URL);
  await HttpRequest.getString(schedulePath).then((resultSchedule) {
    var resultFromJson = jsonDecode(resultSchedule);
    schedule = midevfestschedule.Schedule.fromJson(resultFromJson);
  });

  print('returning SiteData');
  return SiteData(
      theTeam: team,
      theSponsors: sponsors,
      theSpeakers: speakers,
      theSessions: sessions,
      theSchedule: schedule);
}

class MyApp extends StatelessWidget {
  SiteData theData;
  MyApp({this.theData});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    mapDataToAppState(context);

    return MaterialApp(
      title: EN_Strings.devFestName,
      theme: buildTheme(),
      home: MainPage(title: EN_Strings.devFestName),
    );
  }

  void mapDataToAppState(BuildContext context) {
    // set the value of the team for the entire app
    StateWidget.of(context).state.currentTeam = theData.theTeam;
    StateWidget.of(context).state.sponsorList = theData.theSponsors;
    StateWidget.of(context).state.generalInfo = theData.theSchedule.generalInfo;

    //map out the speakers
    StateWidget.of(context).state.speakers = Map<int, Speaker>();
    for (Speaker speaker in theData.theSpeakers.listOfSpeakers) {
      StateWidget.of(context)
          .state
          .speakers
          .putIfAbsent(speaker.id, () => speaker);
      print('added speaker id = ' + speaker.id.toString());
    }

    //map out the sessions
    StateWidget.of(context).state.sessions = Map<int, Session>();
    for (Session session in theData.theSessions.listOfSessions) {
      StateWidget.of(context)
          .state
          .sessions
          .putIfAbsent(session.id, () => session);
      print('added session id = ' + session.id.toString());
    }

    //map out the timeslots
    StateWidget.of(context).state.timeslots = Map<String, Timeslot>();
    for (Timeslot timeslot in theData.theSchedule.timeslots) {
      StateWidget.of(context)
          .state
          .timeslots
          .putIfAbsent(timeslot.startTime, () => timeslot);
      print('added timeslot start time= ' + timeslot.startTime);
    }

    theData = null;
  }
}
