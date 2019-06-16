import 'package:flutter_web/material.dart';
import 'theme.dart';
import './config_values/en_strings.dart';
import './ui/mainpage.dart';
import './ui/teampage.dart';
import './widgets/state_widget.dart';
import './models/site_data.dart';
// import 'package:firebase/firebase.dart';
// import 'package:firebase/firestore.dart' as fs;

void main()=>  { 
  runApp(new StateWidget(child: FutureBuilder<SiteData>(
    future: readFromJson(),
    builder: (BuildContext context, AsyncSnapshot<SiteData> snapshot) {
      return snapshot.hasData
          // ? MyApp(remoteConfig: snapshot.data)
          ? MyApp()
          : Container();
    },
    //new StateWidget(
    //child: new MyApp(),
    //)
  )))
  };

Future<SiteData> readFromJson(){



}


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
