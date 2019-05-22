import 'package:flutter_web/material.dart';

ThemeData buildTheme(String season) {
  // We're going to define all of our font styles
  // in this method:
  TextTheme _buildTextTheme(TextTheme base, String season) {
    TextTheme newTheme = new TextTheme();
    if (season.contains('spring')) {
      newTheme = base.copyWith(
          headline: base.headline.copyWith(
            fontFamily: 'Pacifico',
            fontSize: 55.0,
            color: Colors.amber[200],
          ),
          display1: base.headline.copyWith(
            fontFamily: 'Pacifico',
            fontSize: 36.0,
            color: Colors.amber[200],
          ),
          title: base.title.copyWith(
            fontFamily: 'Pacifico',
            fontSize: 20.0,
            color: Colors.black,
          ),
          subtitle: base.subtitle.copyWith(
            fontFamily: 'Montserrat',
            fontSize: 20.0,
            color: Colors.black,
          ),
          button: base.button.copyWith(
              fontFamily: 'Montserrat', fontSize: 16.0, color: Colors.white));
    } else {
      newTheme = base.copyWith(
          headline: base.headline.copyWith(
            fontFamily: 'Pacifico',
            fontSize: 55.0,
            color: Colors.amber[800],
          ),
          display1: base.headline.copyWith(
            fontFamily: 'Pacifico',
            fontSize: 36.0,
            color: Colors.amber[800],
          ),
          title: base.title.copyWith(
            fontFamily: 'Pacifico',
            fontSize: 20.0,
            color: Colors.black,
          ),
          subtitle: base.subtitle.copyWith(
            fontFamily: 'Montserrat',
            fontSize: 20.0,
            color: Colors.black,
          ),
          button: base.button.copyWith(
              fontFamily: 'Montserrat', fontSize: 16.0, color: Colors.white));
    }
    return newTheme;
  }

  // We want to override a default light blue theme.
  final ThemeData base = ThemeData.light();

  // And apply changes on it:
  return base.copyWith(
      textTheme: _buildTextTheme(base.textTheme, season),
      brightness: Brightness.light,
      accentColor:
          (season.contains('spring')) ? Colors.lightGreen : Colors.lightBlue);
}
