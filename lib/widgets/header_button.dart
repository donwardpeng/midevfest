import 'package:flutter_web/material.dart';
import 'dart:html';

import '../config_values/en_strings.dart';
import 'package:midevfest/ui/teampage.dart';

class header_button extends StatelessWidget {
  String _buttonText = '';
  String _url = 'empty';
  String _urlName = '';
  String _route = 'empty';

  header_button({String buttonText,String url, String urlName, String route}) {
    this._buttonText = buttonText;
    this._url = url;
    this._urlName = urlName;
    this._route = route;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: OutlineButton(
            child: Text(
              _buttonText,
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .apply(color: Colors.white),
            ),
            onPressed: () {
              if (_url != null && _url.contains('http')) {
                // Use the dart:html window class to open a new browser window
                window.open(_url, _urlName);
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TeamPage(title: EN_Strings.devFestName)));
              }
            }));
  }
}
