import 'package:flutter_web/material.dart';
import '../helper/responsive_layout.dart';
import '../ui/large_layout/team_page_layout.dart';
import '../ui/large_layout/footer.dart';
import '../ui/small_layout/team_page_layout.dart';
import '../ui/small_layout/footer.dart';
import '../widgets/state_widget.dart';
import '../models/state.dart';
import '../widgets/header.dart';
import '../values/constants.dart';

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
    appState.currentPage = Constants.PAGES['team'];

    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: Header(context, appState.currentPage).getHeader(),
        bottomNavigationBar: ResponsiveLayout(
            largeChild: LargeFooterWidget(),
            smallChild: SmallFooterWidget()),
        body: ResponsiveLayout(
          largeChild: TeamPageLargeBodyWidget(),
          smallChild: TeamPageSmallBodyWidget(),
        ));
  }
}
