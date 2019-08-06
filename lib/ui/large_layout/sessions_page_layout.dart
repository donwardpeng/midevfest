import 'package:flutter_web/gestures.dart';
import 'package:flutter_web/material.dart';
import '../../widgets/state_widget.dart';
import '../../models/session.dart';
import '../../transitions/scale_route.dart';
import '../../ui/speakers_page.dart';
import '../../config_values/en_strings.dart';

class SessionsPageLargeBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Session> sessionsList = List<Session>();
    StateWidget.of(context)
        .state
        .sessions
        .forEach((key, session) => {sessionsList.add(session)});

    // set the number of elements in the gridview crossaxis count
    int gridViewCount = 4;
    var size = MediaQuery.of(context).size;
    final double _height = size.height / 2;
    final double _width = size.width / gridViewCount;

    return Container(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                    Widget>[
      Padding(
        padding: EdgeInsets.only(top:_height/4),
          child: Card(
              elevation: 24,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                ScaleRoute(
                                    page: SpeakerPage(
                                        title: EN_Strings.devFestName)));
                          },
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text:
                                  'Our complete schedule will be published shortly before the event. \n\nIn the meantime, you can check out all of our speakers',
                              style: Theme.of(context).textTheme.title,
                            ),
                            TextSpan(
                                text: ' here!',
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .apply(color: Colors.blue)),
                          ]))))
                ],
              ))),
    ])) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
