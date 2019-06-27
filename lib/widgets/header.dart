import 'package:flutter_web/material.dart';
import '../widgets/header_button.dart';
import '../helper/responsive_layout.dart';
import '../transitions/scale_route.dart';
import '../ui/main_page.dart';
import '../config_values/en_strings.dart';
import '../widgets/state_widget.dart';
import '../models/state.dart';
import '../values/constants.dart';

class Header {
  BuildContext theContext;
  StateModel appState;
  String currentPage;

  Header(this.theContext, this.currentPage);

  AppBar getHeader() {
    appState = StateWidget.of(theContext).state;
    appState.currentPage = currentPage;
    return AppBar(
      leading: InkWell(
          child: Image.asset('gdg.png', fit: BoxFit.scaleDown),
          onTap: () {
            currentPage != Constants.PAGES['main']
                ? Navigator.push(theContext,
                    ScaleRoute(page: MainPage(title: EN_Strings.devFestName)))
                : print(''); // do nothing if on main page
          }),
      title: ResponsiveLayout(
        largeChild: Text(
          EN_Strings.devFestName,
          style: Theme.of(theContext)
              .textTheme
              .subtitle
              .apply(color: Colors.white),
        ),
        smallChild: Text(''),
      ),
      actions: <Widget>[
        header_button(
          buttonText: 'The Team',
          route: Constants.PAGES['team'],
          currentPage: appState.currentPage,
        ),
        header_button(
          buttonText: 'Sponsors',
          route: Constants.PAGES['sponsors'],
          currentPage: appState.currentPage,
        ),
        header_button(
            buttonText: 'Code of Conduct',
            url: 'https://developers.google.com/events/gdd-india/code-of-conduct/',
            urlName: 'Code of Conduct'),
        header_button(
            buttonText: 'Call For Papers',
            url: 'https://www.papercall.io/midevfest2019',
            urlName: 'Call for Papers'),
      ],
    );
  }
}
