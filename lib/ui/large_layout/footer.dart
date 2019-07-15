import 'package:flutter_web/material.dart';
import '../../config_values/en_strings.dart';
import 'dart:html';

class LargeFooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        // shape: CircularNotchedRectangle(),
        color: Colors.lightBlue,
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                  onTap: () {window.open('https://flutter.dev/', 'Flutter Website');},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child:
                          Container(color: Colors.white, child: FlutterLogo()),
                    ),
                    Text(
                      'Powered by Flutter for Web',
                      style: Theme.of(context)
                          .textTheme
                          .display4
                          .apply(color: Colors.white),
                    )
                  ])),
              Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    EN_Strings.devFestMainPageFooterText,
                    style: Theme.of(context)
                        .textTheme
                        .display4
                        .apply(color: Colors.white),
                  )),
            ]));
  }
}
