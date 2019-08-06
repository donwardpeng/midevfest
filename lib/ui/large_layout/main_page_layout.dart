import 'package:flutter_web/material.dart';
import '../../config_values/en_strings.dart';
import '../../widgets/flutter_swiper.dart';

class MainPageLargeBodyLayout extends StatelessWidget {
double _height;
double _width;

  List<String> imagesList = [
    'carousel/devfest2018_photo_1.jpg',
    'carousel/devfest2018_photo_2.jpg',
    'carousel/devfest2018_photo_3.jpg',
    'carousel/devfest2018_photo_4.jpg',
    'carousel/devfest2018_photo_5.png'
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    _height = size.height;
    _width = size.height;

    return SingleChildScrollView(
        child: Stack(children: <Widget>[
      Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                  Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 0, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                        width: _width/2,
                        height: _height/3,
                        child: Card(
                          child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Image.asset(EN_Strings.headerLogo)),
                          elevation: 4,
                        )),
                  ),
                  Expanded(
                      flex: 2,
                      child: Swiper(
                          autoplay: true,
                          layout: SwiperLayout.STACK,
                          itemHeight: _height/3, //290,
                          itemWidth: _width/2, //325,
                          itemCount: imagesList.length,
                          itemBuilder: (cx, i) {
                            return Container(
                              margin: EdgeInsets.only(top: 2, bottom: 2),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
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
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 20),
                  child: SizedBox(
                    width: _width,
                    child: Card(
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                              child: Text(
                                EN_Strings.devFestNameMainPageBlurb,
                                style: Theme.of(context).textTheme.subtitle,
                              ),
                            )
                          ],
                        )),
                  ),
                ))
          ],
        )
      ] // This trailing comma makes auto-formatting nicer for build methods.
              ))
    ]));
  }
}
