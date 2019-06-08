import 'dart:convert';

import 'package:flutter_web/material.dart';
import '../widgets/main_page_large_body_footer.dart';
import '../widgets/main_page_small_body_footer.dart';
import '../widgets/main_page_large_body_layout.dart';
import '../widgets/main_page_small_body_layout.dart';
import '../config_values/en_strings.dart';
import 'dart:html';
import '../widgets/header_button.dart';
import '../helper/responsive_layout.dart';
import '../transitions/scale_route.dart';
import '../widgets/state_widget.dart';
import '../models/state.dart';

class MainPage extends StatefulWidget {
  final String title;
  MainPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<MainPage> {
  // Map fi;

  Map<String, dynamic> stringResources;
  StateModel appState;

  Future<Map<String, dynamic>> readStrings() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("main_page_string_en.json");
    print("Here is the data read in" + data);
    stringResources = json.decode(data);
    print("Here is the value in String Resources = " +
        stringResources['devFestName']);
    return stringResources;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    appState.currentPage = 'main';
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(
          leading: InkWell(
              child: Image.asset('gdg.png', fit: BoxFit.scaleDown),
              onTap: () {}),
              //   Navigator.push(context,
              //       ScaleRoute(page: MainPage(title: EN_Strings.devFestName)));
              // }),
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
          largeChild: MainPageLargeBodyLayout(),
          smallChild: MainPageSmallBodyLayout(),
        ));
  }
}
