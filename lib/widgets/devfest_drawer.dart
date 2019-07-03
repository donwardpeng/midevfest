import '../widgets/header_button.dart';
import 'package:flutter_web/material.dart';
import '../values/constants.dart';
import '../models/state.dart';
import '../widgets/state_widget.dart';

class DevFestDrawer {
  BuildContext theContext;
  StateModel appState;
  String currentPage;

  DevFestDrawer(this.theContext, this.currentPage);

  Drawer getDrawer() {
    appState = StateWidget.of(theContext).state;
    appState.currentPage = currentPage;
    return Drawer(
        child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,

      children: <Widget>[
        Container(
          height: 128.0,
          child: DrawerHeader(
              child: Text('Michigan DevFest',
                  textAlign: TextAlign.center,
                  style: Theme.of(theContext)
                      .textTheme
                      .display1
                      .apply(color: Colors.white))),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        header_button(
            buttonText: 'main',
            route: Constants.PAGES['main'],
            currentPage: appState.currentPage,
            buttonTextStyle: Theme.of(theContext)
                .textTheme
                .display1
                .apply(color: Colors.blue)),
        header_button(
            buttonText: 'team',
            route: Constants.PAGES['team'],
            currentPage: appState.currentPage,
            buttonTextStyle: Theme.of(theContext)
                .textTheme
                .display1
                .apply(color: Colors.blue)),
        header_button(
            buttonText: 'sponsors',
            route: Constants.PAGES['sponsors'],
            currentPage: appState.currentPage,
            buttonTextStyle: Theme.of(theContext)
                .textTheme
                .display1
                .apply(color: Colors.blue)),
        header_button(
            buttonText: 'code of conduct',
            url: Constants.CODE_OF_CONDUCT_URL,
            urlName: 'Code of Conduct',
            buttonTextStyle: Theme.of(theContext)
                .textTheme
                .display1
                .apply(color: Colors.blue)),
        header_button(
            buttonText: 'call for papers',
            url: 'https://www.papercall.io/midevfest2019',
            urlName: 'Call for Papers',
            buttonTextStyle: Theme.of(theContext)
                .textTheme
                .display1
                .apply(color: Colors.blue)),
      ],
    ));
  }
}