import 'package:flutter_web/material.dart';
import '../config_values/en_strings.dart';
import 'dart:html';
import '../widgets/header_button.dart';
import './mainpage.dart';
import '../helper/responsive_layout.dart';
import '../ui/large_layout/team_page_layout.dart';
import '../ui/large_layout/main_page_footer.dart';
import '../ui/small_layout/team_page_layout.dart';
import '../ui/small_layout/main_page_footer.dart';
import '../transitions/scale_route.dart';
import '../widgets/state_widget.dart';
import '../models/state.dart';

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
  StateModel appState;

  @override
  void initState() {
    print('in initState');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    appState.currentPage = StateModel.PAGES['team'];

    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(
          leading: InkWell(
              child: Image.asset('gdg.png', fit: BoxFit.scaleDown),
              onTap: () {
                Navigator.push(context,
                    ScaleRoute(page: MainPage(title: EN_Strings.devFestName)));
              }),
          title: ResponsiveLayout(
            largeChild: Text(
              EN_Strings.devFestName,
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .apply(color: Colors.white),
            ),
            smallChild: Text(''),
          ),
          actions: <Widget>[
            header_button(
              buttonText: 'The Team',
              route: 'TeamPage.dart',
              currentPage: appState.currentPage,
            ),
            header_button(
                buttonText: 'Call For Papers',
                url: 'https://www.papercall.io/midevfest2019',
                urlName: 'Call for Papers'),
          ],
        ),
        bottomNavigationBar: ResponsiveLayout(
            largeChild: MainPageLargeBodyFooterWidget(),
            smallChild: MainPageSmallBodyFooterWidget()),
        body: ResponsiveLayout(
          largeChild: TeamPageLargeBodyWidget(),
          smallChild: TeamPageSmallBodyWidget(),
        ));
  }
}
