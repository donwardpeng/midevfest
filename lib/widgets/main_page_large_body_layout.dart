import 'package:flutter_web/material.dart';
import '../config_values/en_strings.dart';
import '../widgets/flutter_swiper.dart';

class MainPageLargeBodyLayout extends StatelessWidget{

  List<String> imagesList = [
    'devfest2018_photo_1.jpg',
    'devfest2018_photo_2.jpg',
    'devfest2018_photo_3.jpg'
  ];

@override
Widget build(BuildContext context) {
  return SingleChildScrollView(
              child: Center(
                  child:
                      Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                              Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: SizedBox(
                            width: 500,
                            height: 300,
                            child: Card(
                              child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Image.asset(EN_Strings.headerLogo)),
                              elevation: 16,
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
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                      child: SizedBox(
                        width: 800,
                        // height: 300,
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