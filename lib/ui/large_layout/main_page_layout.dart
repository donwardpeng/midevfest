import 'package:flutter_web/material.dart';
import '../../config_values/en_strings.dart';
import '../../widgets/flutter_swiper.dart';
import 'dart:async';
import '../../widgets/state_widget.dart';
import '../../widgets/count_down_timer_widget.dart';

class MainPageLargeBodyLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageLargeBodyLayoutState();
  }
}

class MainPageLargeBodyLayoutState extends State<MainPageLargeBodyLayout> {
  double _height;
  double _width;
  double _heightToShrink = 900;
  double _ShrinkFactor = 1;
  int _attendeeCount = 0;
  int _tracksCount = 0;
  int _sessionsCount = 0;
  int _daysCount = 0;

  Timer _attendeeCountTimer;
  Timer _tracksCountTimer;
  Timer _sessionsCountTimer;
  Timer _daysCountTimer;

  List<String> imagesList = [
    'carousel/devfest2018_photo_1.jpg',
    'carousel/devfest2018_photo_2.jpg',
    'carousel/devfest2018_photo_3.jpg',
    'carousel/devfest2018_photo_4.jpg',
    'carousel/devfest2018_photo_5.png'
  ];

  void startAttendeeCountTimer() {
    const oneSec = const Duration(milliseconds: 1);
    _attendeeCountTimer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_attendeeCount > 200) {
            timer.cancel();
            StateWidget.of(context).state.setHasDisplayedMainScreenTrue();
          } else {
            _attendeeCount = _attendeeCount + 1;
          }
        },
      ),
    );
  }

  void startTrackCountTimer() {
    const oneSec = const Duration(milliseconds: 250);
    _tracksCountTimer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_tracksCount > 3) {
            timer.cancel();
          } else {
            _tracksCount = _tracksCount + 1;
          }
        },
      ),
    );
  }

  void startSessionsCountTimer() {
    const oneSec = const Duration(milliseconds: 50);
    _sessionsCountTimer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_sessionsCount > 200) {
            timer.cancel();
          } else {
            _sessionsCount = _sessionsCount + 1;
          }
        },
      ),
    );
  }

  void startDaysCountTimer() {
    const oneSec = const Duration(seconds: 1);
    _daysCountTimer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_daysCount > 0) {
            timer.cancel();
          } else {
            _daysCount = _daysCount + 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _attendeeCountTimer.cancel();
    _tracksCountTimer.cancel();
    _sessionsCountTimer.cancel();
    _daysCountTimer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startAttendeeCountTimer();
    startTrackCountTimer();
    startSessionsCountTimer();
    startDaysCountTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    _height = size.height;
    _width = size.height;
    _ShrinkFactor = (1 - ((_heightToShrink - _height) / _heightToShrink));

    return Scrollbar(
        child: ListView(children: <Widget>[
      Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 0, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                        width: _width / 2,
                        height: _height / 3,
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
                          itemHeight: _height / 3, //290,
                          itemWidth: _width / 2, //325,
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
        ),
        Container(
            color: Colors.blue,
            child: Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        width: _width,
                        height: _height / 4,
                        child: GridView.count(
                          crossAxisCount: 4,
                          shrinkWrap: true,
                          children: <Widget>[
                            Card(
                                color: Colors.blue,
                                elevation: 0,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text.rich(
                                      TextSpan(children: [
                                        TextSpan(
                                            text: StateWidget.of(context)
                                                    .state
                                                    .hasDisplayedMainScreen()
                                                ? '200+\n'
                                                : _attendeeCount <= 200
                                                    ? '$_attendeeCount\n'
                                                    : '200+\n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .title
                                                .apply(
                                                    color: Colors.white,
                                                    fontFamily:
                                                        'Open-Sans-Extra-Bold',
                                                    fontSizeFactor:
                                                        2.5 * _ShrinkFactor)),
                                        TextSpan(
                                            text: 'ATTENDEES',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle
                                                .apply(
                                                    color: Colors.white,
                                                    fontFamily:
                                                        'Open-Sans-Extra-Bold',
                                                    fontSizeFactor:
                                                        1.0 * _ShrinkFactor)),
                                      ]),
                                      textAlign: TextAlign.center),
                                )),
                            Card(
                                color: Colors.blue,
                                elevation: 0,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text.rich(
                                      TextSpan(children: [
                                        TextSpan(
                                            text: StateWidget.of(context)
                                                    .state
                                                    .hasDisplayedMainScreen()
                                                ? '4\n'
                                                : '$_tracksCount\n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .title
                                                .apply(
                                                    color: Colors.white,
                                                    fontFamily:
                                                        'Open-Sans-Extra-Bold',
                                                    fontSizeFactor:
                                                        2.5 * _ShrinkFactor)),
                                        TextSpan(
                                            text: 'TRACKS',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle
                                                .apply(
                                                    color: Colors.white,
                                                    fontFamily:
                                                        'Open-Sans-Extra-Bold',
                                                    fontSizeFactor:
                                                        1.0 * _ShrinkFactor)),
                                      ]),
                                      textAlign: TextAlign.center),
                                )),
                            Card(
                                color: Colors.blue,
                                elevation: 0,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text.rich(
                                      TextSpan(children: [
                                        TextSpan(
                                            text: StateWidget.of(context)
                                                    .state
                                                    .hasDisplayedMainScreen()
                                                ? '20+\n'
                                                : _sessionsCount <= 20
                                                    ? '$_sessionsCount\n'
                                                    : '20+\n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .title
                                                .apply(
                                                    color: Colors.white,
                                                    fontFamily:
                                                        'Open-Sans-Extra-Bold',
                                                    fontSizeFactor:
                                                        2.5 * _ShrinkFactor)),
                                        TextSpan(
                                            text: 'SESSIONS',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle
                                                .apply(
                                                    color: Colors.white,
                                                    fontFamily:
                                                        'Open-Sans-Extra-Bold',
                                                    fontSizeFactor:
                                                        1.0 * _ShrinkFactor)),
                                      ]),
                                      textAlign: TextAlign.center),
                                )),
                            Card(
                                color: Colors.blue,
                                elevation: 0,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text.rich(
                                      TextSpan(children: [
                                        TextSpan(
                                            text: StateWidget.of(context)
                                                    .state
                                                    .hasDisplayedMainScreen()
                                                ? '1\n'
                                                : '$_daysCount\n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .title
                                                .apply(
                                                    color: Colors.white,
                                                    fontFamily:
                                                        'Open-Sans-Extra-Bold',
                                                    fontSizeFactor:
                                                        2.5 * _ShrinkFactor)),
                                        TextSpan(
                                            text: 'DAY',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle
                                                .apply(
                                                    color: Colors.white,
                                                    fontFamily:
                                                        'Open-Sans-Extra-Bold',
                                                    fontSizeFactor:
                                                        1.0 * _ShrinkFactor)),
                                      ]),
                                      textAlign: TextAlign.center),
                                )),
                          ],
                        ))
                  ],
                ))),
      ])
    ]));
  }
}
