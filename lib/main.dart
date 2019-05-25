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
    return HomePageState();
  }
}
class HomePageState extends State<MyHomePage>{

  List<String> imagesList = ['devfest2018_photo_1.jpg','devfest2018_photo_2.jpg', 'devfest2018_photo_3.jpg' ];
  // Map fi;

  @override
  Widget build(BuildContext context) {
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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      width: 600,
                      height: 300,
                      child: Card(child: Image.asset('midevfest_logo.png'), elevation: 24,)),
              Expanded(
              flex: 4,
              child: 
              Swiper(
                  autoplay: true,
                  // outer: true,
                  layout: SwiperLayout.TINDER,
                  itemHeight: 350,
                  itemWidth: 350,
                  // scrollDirection: Axis.vertical,
                 // onIndexChanged: (n) => setState(() => fi = imagesList[n]),
                  itemCount: imagesList.length,
                  itemBuilder: (cx, i) {
                    return Container(
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:
                              Image.asset(imagesList[i], fit: BoxFit.cover)),
                        );
                  },
                  viewportFraction: .85,
                  scale: .9)
                  )
                  ,]),
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