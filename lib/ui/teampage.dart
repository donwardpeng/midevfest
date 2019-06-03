import 'package:flutter_web/material.dart';
import '../config_values/en_strings.dart';
import 'dart:html';
import '../widgets/header_button.dart';
import './mainpage.dart';
import '../widgets/people_cardview.dart';

class TeamPage extends StatefulWidget {
  final String title;
  TeamPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    print('in create State');
    return TeamPageState();
  }
}

class TeamPageState extends State<TeamPage> {
  @override
  void initState() {
    print('in initState');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('in build');
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(
          leading: InkWell(
              child: Image.asset('gdg.png', fit: BoxFit.scaleDown),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MainPage(title: EN_Strings.devFestName)));
              }),
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
                    peopleCardView(name: 'Todd Deland', image: 'people/todd_deland.jpg' ),
                    peopleCardView(name: 'Dave Koziol', image: 'people/dave_koziol.jpg' ),
                    peopleCardView(name: 'Jingran Wang', image: 'people/jingran_wang.jpeg' ),
                    peopleCardView(name: 'Don Ward', image: 'people/don_ward.jpg' ),
                    peopleCardView(name: 'Scott Weber', image: 'people/scott_weber.jpg' ),                    
                  ],
                ))
          ],
        )));
  }
}
