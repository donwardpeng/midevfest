import 'package:flutter_web/material.dart';
import 'theme.dart';
import './config_values/en_strings.dart';
import './ui/main_page.dart';
import './widgets/state_widget.dart';
import './models/team.dart';
import './models/sponsor_list.dart';
import './models/site_data.dart';

import 'dart:convert';
import 'dart:html';
import './values/constants.dart';


// import 'dart:io';
// import 'package:firebase/firebase.dart';
// import 'package:firebase/firestore.dart' as fs;

void main() {
  runApp(new StateWidget(
      child: FutureBuilder<SiteData>(
    future: readFromJson(),
    builder: (BuildContext context, AsyncSnapshot<SiteData> snapshot) {
      print('Snapshot hasData? -> ' + snapshot.hasData.toString());

      return snapshot.hasData ? MyApp(theTeam: snapshot.data.theTeam, sponsorList: snapshot.data.theSponsors) : Container();
    },
  )));
}

Future<SiteData> readFromJson() async {
  print('here 1');
  Team team;
  SponsorList sponsors;
  var path = Constants.TEAM_DATA_URL;
  await HttpRequest.getString(path).then((result) {
    var resultFromJson = jsonDecode(result);
    team = Team.fromJson(resultFromJson);
  });
  print('here 2');
  path = Constants.SPONSOR_DATA_URL;
  await HttpRequest.getString(path).then((result) {
    var resultFromJson = jsonDecode(result);
    sponsors = SponsorList.fromJson(resultFromJson);
  });
  print('here 3');
  return SiteData(team,sponsors);
}

class MyApp extends StatelessWidget {
  Team theTeam;
  SponsorList sponsorList;
  MyApp({this.theTeam, this.sponsorList});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // set the value of the team for the entire app
    StateWidget.of(context).state.currentTeam = theTeam; 
    StateWidget.of(context).state.sponsorList = sponsorList; 

    return MaterialApp(
      title: EN_Strings.devFestName,
      theme: buildTheme(),
      home: MainPage(title: EN_Strings.devFestName),
    );
  }
}
