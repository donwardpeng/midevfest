import 'package:flutter_web/material.dart';
import '../config_values/en_strings.dart';
import 'dart:html';
import '../widgets/header_button.dart';
import './main_page.dart';
import '../helper/responsive_layout.dart';
import '../ui/large_layout/sponsors_page_layout.dart';
import '../ui/large_layout/footer.dart';
import '../ui/small_layout/team_page_layout.dart';
import '../ui/small_layout/footer.dart';
import '../transitions/scale_route.dart';
import '../widgets/state_widget.dart';
import '../models/state.dart';
import '../values/constants.dart';
import '../widgets/header.dart';

class SponsorsPage extends StatefulWidget {
  final String title;

  SponsorsPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SponsorPageState();
  }
}

class SponsorPageState extends State<SponsorsPage> {
  StateModel appState;

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    appState.currentPage = Constants.PAGES['sponsors'];

    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: Header(context, appState.currentPage).getHeader(),
        bottomNavigationBar: ResponsiveLayout(
            largeChild: LargeFooterWidget(),
            smallChild: SmallFooterWidget()),
        body: ResponsiveLayout(
          largeChild: SponsorsPageLargeBodyWidget(),
          smallChild: TeamPageSmallBodyWidget(),
        ));
  }
}
