import 'package:flutter_web/material.dart';
import 'theme.dart';
import './config_values/en_strings.dart';
import './ui/mainpage.dart';
import './widgets/state_widget.dart';
import './models/team.dart';
import 'dart:convert';
import 'dart:html';
// import 'dart:io';
// import 'package:firebase/firebase.dart';
// import 'package:firebase/firestore.dart' as fs;

void main() {
  runApp(new StateWidget(
      child: FutureBuilder<Team>(
    future: readFromJson(),
    builder: (BuildContext context, AsyncSnapshot<Team> snapshot) {
      print('Snapshot hasData? -> ' + snapshot.hasData.toString());

      return snapshot.hasData ? MyApp(theTeam: snapshot.data) : Container();
    },
  )));
}

Future<Team> readFromJson() async {
  print('here 1');
  Team team;
  var path = 'assets/data/team.json';
  await HttpRequest.getString(path).then((result) {
    var resultFromJson = jsonDecode(result);
    team = Team.fromJson(resultFromJson);
  });
  return team;
}

class MyApp extends StatelessWidget {
  Team theTeam;
  MyApp({this.theTeam});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // set the value of the team for the entire app
    StateWidget.of(context).state.currentTeam = theTeam;    
    return MaterialApp(
      title: EN_Strings.devFestName,
      theme: buildTheme(),
      home: MainPage(title: EN_Strings.devFestName),
    );
  }
}
