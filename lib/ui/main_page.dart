import 'dart:convert';

import 'package:flutter_web/material.dart';
import '../ui/large_layout/footer.dart';
import '../ui/large_layout/main_page_layout.dart';
import '../ui/small_layout/footer.dart';
import '../ui/small_layout/main_page_layout.dart';
import '../helper/responsive_layout.dart';
import '../widgets/state_widget.dart';
import '../models/state.dart';
import '../widgets/header.dart';
import '../values/constants.dart';

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
    appState.currentPage = Constants.PAGES['main'];
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: Header(context, appState.currentPage).getHeader(),
        bottomNavigationBar: ResponsiveLayout(
            largeChild: LargeFooterWidget(),
            smallChild: SmallFooterWidget()),
        body: ResponsiveLayout(
          largeChild: MainPageLargeBodyLayout(),
          smallChild: MainPageSmallBodyLayout(),
        ));
  }
}
