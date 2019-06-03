import 'package:flutter_web/material.dart';
import '../config_values/en_strings.dart';

class MainPageLargeBodyFooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        // shape: CircularNotchedRectangle(),
        color: Colors.lightBlue,
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    'Powered by Flutter for Web',
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .apply(color: Colors.white),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    EN_Strings.devFestMainPageFooterText,
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .apply(color: Colors.white),
                  )),

              // IconButton(
              //   icon: Image.asset('facebook.png'),
              // ),
              // IconButton(icon: Image.asset('twitter.png'))
            ]));
  }
}
