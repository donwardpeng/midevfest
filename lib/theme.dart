import 'package:flutter_web/material.dart';

ThemeData buildTheme() {
  // We're going to define all of our font styles
  // in this method:
  TextTheme _buildTextTheme(TextTheme base) {
    TextTheme newTheme = TextTheme();

    newTheme = base.copyWith(
        headline: base.headline.copyWith(
          fontFamily: 'Roboto-Light',
          fontSize: 60.0,
          color: Colors.black87,
        ),
        display1: base.headline.copyWith(
          fontFamily: 'Roboto-Light',
          fontSize: 36.0,
          color: Colors.black87,
        ),
        //use this for the people's names
        title: base.title.copyWith(
          fontFamily: 'Roboto-Light',
          fontSize: 28.0,
          color: Colors.black,
        ),
        //use this for subtitle's on cards
        subtitle: base.subtitle.copyWith(
          fontFamily: 'Roboto-Light',
          fontSize: 24.0,
          color: Colors.black,
        ),
        //use this for cards
        body1: base.body1.copyWith(
          fontFamily: 'Roboto-Light',
          fontSize: 20.0,
          color: Colors.black,
        ),
        //use this for the header and footer
        display4: base.display4.copyWith(
          fontFamily: 'Roboto-Light',
          fontSize: 20.0,
          color: Colors.black,
        ),

        button: base.button.copyWith(
            fontFamily: 'Roboto-Light', fontSize: 16.0, color: Colors.white));
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
