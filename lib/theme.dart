import 'package:flutter_web/material.dart';

ThemeData buildTheme() {
  // We're going to define all of our font styles
  // in this method:
  TextTheme _buildTextTheme(TextTheme base) {
    TextTheme newTheme = new TextTheme();
    
      newTheme = base.copyWith(
          headline: base.headline.copyWith(
            fontFamily: 'Ubuntu',
            fontSize: 55.0,
            color: Colors.amber[200],
          ),
          display1: base.headline.copyWith(
            fontFamily: 'Ubuntu',
            fontSize: 36.0,
            color: Colors.amber[200],
          ),
          title: base.title.copyWith(
            fontFamily: 'Ubuntu',
            fontSize: 20.0,
            color: Colors.black,
          ),
          subtitle: base.subtitle.copyWith(
            fontFamily: 'Montserrat',
            fontSize: 20.0,
            color: Colors.black,
          ),
          body1: base.body1.copyWith(
            fontFamily: 'Ubuntu',
            fontSize: 20.0,
            color: Colors.black,
          ),
          button: base.button.copyWith(
              fontFamily: 'Montserrat', fontSize: 16.0, color: Colors.white));
    return newTheme;
  }

  // We want to override a default light blue theme.
  final ThemeData base = ThemeData.light();

  // And apply changes on it:
  return base.copyWith(
      textTheme: _buildTextTheme(base.textTheme),
      brightness: Brightness.light,
      accentColor: Colors.lightBlue);
}
