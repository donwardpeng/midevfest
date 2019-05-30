import 'dart:convert';

import 'package:flutter_web/material.dart';
import 'theme.dart';
import 'flutter_swiper.dart';
import './config_values/en_strings.dart';
import './plugins/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: EN_Strings.devFestName,
      theme: buildTheme('summer'),
      home: MyHomePage(title: EN_Strings.devFestName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<MyHomePage> {
  List<String> imagesList = [
    'devfest2018_photo_1.jpg',
    'devfest2018_photo_2.jpg',
    'devfest2018_photo_3.jpg'
  ];
  // Map fi;

  Map<String, dynamic> stringResources;

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
            OutlineButton(
                child: Text(
                  'Call For Papers',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .apply(color: Colors.white),
                ),
                onPressed: () {
                  print('button pressed');
                  launch('https://www.papercall.io/midevfest2019', forceWebView: true);
                })
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            color: Colors.lightBlue,
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Brought to you by Ann Arbor and Detroit Google Developers Groups',
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .apply(color: Colors.white),
                  )
                ])),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                        Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                          width: 500,
                          height: 250,
                          child: Card(
                            child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Image.asset('midevfest_logo.png')),
                            elevation: 24,
                          )),
                    ),
                    Expanded(
                        flex: 2,
                        child: Swiper(
                            autoplay: true,
                            // outer: true,
                            layout: SwiperLayout.TINDER,
                            itemHeight: 325,
                            itemWidth: 325,
                            // scrollDirection: Axis.vertical,
                            // onIndexChanged: (n) => setState(() => fi = imagesList[n]),
                            itemCount: imagesList.length,
                            itemBuilder: (cx, i) {
                              return Container(
                                margin: EdgeInsets.only(top: 8, bottom: 8),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(imagesList[i],
                                        fit: BoxFit.cover)),
                              );
                            },
                            viewportFraction: .85,
                            scale: .9)),
                  ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: SizedBox(
                      width: 800,
                      height: 300,
                      child: Card(
                          elevation: 24,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: Text(
                                  EN_Strings.devFestNameMainPageBlurb,
                                  style: Theme.of(context).textTheme.body1,
                                ),
                              )
                            ],
                          )),
                    ),
                  ))
            ],
          )
        ] // This trailing comma makes auto-formatting nicer for build methods.
                    )));
  }
}
