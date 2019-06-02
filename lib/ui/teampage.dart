import 'package:flutter_web/material.dart';
import '../config_values/en_strings.dart';
import 'dart:html';
import '../widgets/header_button.dart';

class TeamPage extends StatefulWidget {
  final String title;
  TeamPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TeamPageState();
  }
}

class TeamPageState extends State<TeamPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(
          leading: Image.asset(
            'gdg.png',
            fit: BoxFit.scaleDown,
          ),
          title: Text(
            widget.title,
            style:
                Theme.of(context).textTheme.subtitle.apply(color: Colors.white),
          ),
          actions: <Widget>[
            header_button(
              buttonText: 'The Team',
              route: 'TeamPage.dart',
            ),
            header_button(
                buttonText: 'Call For Papers',
                url: 'https://www.papercall.io/midevfest2019',
                urlName: 'Call for Papers'),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            color: Colors.lightBlue,
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    EN_Strings.devFestMainPageFooterText,
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .apply(color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  ),
                  IconButton(
                    icon: Image.asset('facebook.png'),
                  ),
                  IconButton(icon: Image.asset('twitter.png'))
                ])),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Test'),
                    // Expanded(
                    //     flex: 4,
                    //     child: SizedBox(
                    //         width: 500,
                    //         height: 250,
                    //         child: Container(
                    //             width: 190.0,
                    //             height: 190.0,
                    //             decoration: new BoxDecoration(
                    //                 shape: BoxShape.circle,
                    //                 image: new DecorationImage(
                    //                     fit: BoxFit.fill,
                    //                     image: AssetImage(
                    //                         "facebook.png"))))))
                  ],
                ))
          ],
        )));
  }
}
