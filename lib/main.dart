import 'package:flutter_web/material.dart';
import 'theme.dart';
import 'flutter_swiper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Michigan DevFest 2019',
      theme: buildTheme('summer'),
      home: MyHomePage(title: 'Michigan DevFest 2019'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

 @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}
class HomePageState extends State<MyHomePage>{

  List<String> imagesList = ['devfest2018_photo_1.jpg','devfest2018_photo_2.jpg', 'devfest2018_photo_3.jpg' ];
 

  // Map fi;

  @override
  Widget build(BuildContext context) {
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
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
            )
          ],
        ),
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
                // Column is also layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Invoke "debug painting" (choose the "Toggle Debug Paint" action
                // from the Flutter Inspector in Android Studio, or the "Toggle Debug
                // Paint" command in Visual Studio Code) to see the wireframe for each
                // widget.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
              Expanded(
              flex: 5,
              child: 
              Swiper(
                  autoplay: true,
                 // onIndexChanged: (n) => setState(() => fi = imagesList[n]),
                  itemCount: imagesList.length,
                  itemBuilder: (cx, i) {
                    return Container(
                        margin: EdgeInsets.only(top: 40, bottom: 24),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child:
                              Image.asset(imagesList[i], fit: BoxFit.cover)),
                        );
                  },
                  viewportFraction: .85,
                  scale: .9)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      width: 600,
                      height: 300,
                      child: Card(child: Image.asset('midevfest_logo.png'), elevation: 24,)),
                  SizedBox(
                    width: 500,
                    height: 300,
                    child: Card(
                      elevation: 24,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'More Details Coming Soon!',
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        // Text(
                        //   '',
                        //   style: Theme.of(context).textTheme.subtitle,
                        // )
                      ],
                    )),
                  ),
                ],
              )
            ] // This trailing comma makes auto-formatting nicer for build methods.
                )));
  }
}
