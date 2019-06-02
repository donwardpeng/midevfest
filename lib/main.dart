import 'package:flutter_web/material.dart';
import 'theme.dart';
import './config_values/en_strings.dart';
import './ui/mainpage.dart';
import './ui/teampage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: EN_Strings.devFestName,
      theme: buildTheme('summer'),
      home: MainPage(title: EN_Strings.devFestName),
    );
  }
}

