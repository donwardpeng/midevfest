import 'package:flutter_web/material.dart';
import 'theme.dart';
import './config_values/en_strings.dart';
import './ui/mainpage.dart';
import './widgets/state_widget.dart';
import './models/teams.dart';
import 'dart:convert';
// import 'dart:io';
// import 'package:firebase/firebase.dart';
// import 'package:firebase/firestore.dart' as fs;

void main()=>  { 
  // runApp(new StateWidget(child: FutureBuilder<Teams>(
  //   future: readFromJson(),
  //   builder: (BuildContext context, AsyncSnapshot<Teams> snapshot) {
  //     return snapshot.hasData
  //         // ? MyApp(remoteConfig: snapshot.data)
  //         ? MyApp()
  //         : Container();
  //   },
    runApp(new StateWidget(
    child: new MyApp(),
    )
  )
  };

// Future<Teams> readFromJson() async{
// print ('here 1');
// var result = json.decode(await new File('./data/team.json').readAsString());
// print (result['title']);
// var teams = Teams.fromJson(result);
// return teams;
// }


void readFromFirestore() {
  // initializeApp(
  //     apiKey: "AIzaSyB6wVoCJ1wT0lzDj9m2LKk_cYHJY53keYo",
  //     authDomain: "midevfest-dev.firebaseapp.com",
  //     databaseURL: "https://midevfest-dev.firebaseio.com",
  //     projectId: "midevfest-dev",
  //     storageBucket: "midevfest-dev.appspot.com",
  //     messagingSenderId: "93056344953");

//   fs.Firestore store = firestore();
//   fs.CollectionReference ref = store.collection("team");

//   ref.onSnapshot.listen((querySnapshot) {
//     querySnapshot.docChanges().forEach((change) {
//       if (change.type == "added") {
//         // print('Got something - ' + change.doc.toString());
//       }
//     });
//   });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: EN_Strings.devFestName,
      theme: buildTheme(),
      home: MainPage(title: EN_Strings.devFestName),
    );
  }
}
