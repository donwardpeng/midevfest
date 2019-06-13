import 'package:flutter_web/material.dart';
import 'theme.dart';
import './config_values/en_strings.dart';
import './ui/mainpage.dart';
import './ui/teampage.dart';
import './widgets/state_widget.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;

external void log(dynamic str);

void main() => runApp(new StateWidget(child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // log('Hello MIDevFest!');    
    
    return MaterialApp(
      title: EN_Strings.devFestName,
      theme: buildTheme(),
      home: MainPage(title: EN_Strings.devFestName),
    );
  }
}
