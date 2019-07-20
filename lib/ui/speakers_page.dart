import 'package:flutter_web/material.dart';
import '../helper/responsive_layout.dart';
import '../ui/large_layout/speaker_page_layout.dart';
import '../ui/large_layout/footer.dart';
import '../ui/small_layout/speaker_page_layout.dart';
import '../ui/small_layout/footer.dart';
import '../widgets/state_widget.dart';
import '../models/state.dart';
import '../widgets/header.dart';
import '../values/constants.dart';
import '../widgets/devfest_drawer.dart';

class SpeakerPage extends StatefulWidget {
  final String title;

  SpeakerPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    print('in Speakers create State');
    return SpeakerPageState();
  }
}

class SpeakerPageState extends State<SpeakerPage> {
  StateModel appState;

  @override
  void initState() {
    print('in Speakers initState');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    appState.currentPage = Constants.PAGES['speakers'];
    bool displayDrawer = appState.isSmallScreen(context);
    final GlobalKey<ScaffoldState> _scaffoldKey =
        GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.blue[50],
        appBar: !displayDrawer
            ? Header(context, appState.currentPage).getHeader()
            : AppBar(
                leading: InkWell(
                    child: Image.asset('gdg.png', fit: BoxFit.scaleDown),
                    onTap: () {
                      _scaffoldKey.currentState.openDrawer();
                    })),
        drawer: displayDrawer
            ? DevFestDrawer(context, appState.currentPage).getDrawer()
            : Container(),
        bottomNavigationBar: ResponsiveLayout(
            largeChild: LargeFooterWidget(), smallChild: SmallFooterWidget()),
        body: ResponsiveLayout(
          largeChild: SpeakerPageLargeBodyWidget(),
          smallChild: SpeakerPageSmallBodyWidget(),
        ));
  }
}
