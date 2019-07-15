import 'package:flutter_web/material.dart';
import 'package:midevfest/ui/main_page.dart';
import 'package:midevfest/ui/sponsors_page.dart';
import 'dart:html';

import '../config_values/en_strings.dart';
import '../ui/team_page.dart';
import '../transitions/scale_route.dart';
import '../values/constants.dart';
import '../ui/sponsors_page.dart';
import '../ui/speakers_page.dart';

class header_button extends StatelessWidget {
  String _buttonText = '';
  String _url = 'empty';
  String _urlName = '';
  String _route = 'empty';
  String _currentPage = '';
  TextStyle _buttonTextStyle;

  header_button(
      {String buttonText,
      String url,
      String urlName,
      String route,
      String currentPage,
      TextStyle buttonTextStyle}) {
    this._buttonText = buttonText;
    this._url = url;
    this._urlName = urlName;
    this._route = route;
    this._currentPage = currentPage;
    this._buttonTextStyle = buttonTextStyle;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: FlatButton(
            child: Text(
              _buttonText,
              style: _buttonTextStyle != null
                  ? _buttonTextStyle
                  : Theme.of(context)
                      .textTheme
                      .subtitle
                      .apply(color: Colors.white),
            ),
            onPressed: () {
              if (_url != null && _url.contains('http')) {
                // Use the dart:html window class to open a new browser window
                window.open(_url, _urlName);
              } else if (_route == Constants.PAGES['main']) {
                Navigator.push(context,
                    ScaleRoute(page: MainPage(title: EN_Strings.devFestName)));
              } else if (_route == Constants.PAGES['team']) {
                Navigator.push(context,
                    ScaleRoute(page: TeamPage(title: EN_Strings.devFestName)));
              } else if (_route == Constants.PAGES['sponsors']) {
                Navigator.push(
                    context,
                    ScaleRoute(
                        page: SponsorsPage(title: EN_Strings.devFestName)));
              } else if (_route == Constants.PAGES['speakers']) {
                Navigator.push(
                    context,
                    ScaleRoute(
                        page: SpeakerPage(title: EN_Strings.devFestName)));
              }
            }));
  }
}
