import 'package:flutter_web/material.dart';
import 'dart:html';
import '../helper/firebase_cloud_storage_resolver.dart';
import '../values/constants.dart';
import '../models/speaker.dart';
import '../widgets/state_widget.dart';
import '../models/session.dart';

class speakerCardView extends StatelessWidget {
  final double SMALL_ICON_SIZE = 30;
  final double LARGE_ICON_SIZE = 36;
  double _iconSize;
  Speaker _speaker;
  bool _smallCard;
  String _twitter;
  String _github;
  List<Session> _speakerSession = List<Session>();
  double _parentWidth;
  double _parentHeight;
  String _sessionLink;

  speakerCardView(
      {Speaker speaker,
      String twitter,
      String github,
      bool smallCard,
      parentWidth,
      parentHeight,
      sessionLink}) {
    _speaker = speaker;
    _twitter = twitter;
    _github = github;
    _smallCard = smallCard;
    _iconSize = _smallCard ? SMALL_ICON_SIZE : LARGE_ICON_SIZE;
    _parentWidth = parentWidth;
    _parentHeight = parentHeight;
    _sessionLink = sessionLink;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        //outer padding for Cardview
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Card(
            child: Stack(children: <Widget>[
          Positioned(
              top: 0.0,
              left: 0.0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                            top: 8, left: 24, bottom: 8, right: 24),
                        child: Container(
                            width: _parentWidth - 48,
                            height: _parentHeight / 1.75,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        FirebaseCloudStorageURLResolver()
                                            .getCloudStorageURL(
                                                Constants.DEVFEST_BUCKET,
                                                _speaker.photoUrl)))))),
                    Padding(
                        padding: EdgeInsets.only(bottom: 16, left: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(_speaker.name,
                                style: Theme.of(context).textTheme.title),
                            Text(_speaker.company,
                                style: Theme.of(context).textTheme.subtitle),
                          ],
                        ))
                  ])),
          Positioned(
              bottom: 8.0,
              right: 8.0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    (_twitter != null && _twitter.contains('twitter'))
                        ? Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: InkWell(
                              child: Image.asset(
                                'twitter.png',
                                height: _iconSize,
                                width: _iconSize,
                              ),
                              onTap: () {
                                window.open(_twitter, 'Twitter');
                              },
                            ))
                        : Container(),
                    (_github != null && _github.contains('github'))
                        ? Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: InkWell(
                              child: Image.asset(
                                'github.png',
                                height: _iconSize,
                                width: _iconSize,
                              ),
                              onTap: () {
                                window.open(_github, 'Github');
                              },
                            ))
                        : Container(),
                    Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: OutlineButton(
                            child: Text('Session Info'),
                            textColor: Colors.blue,
                            onPressed: () {
                              findSession(context);
                              Dialog sessionDialog = getDialog(context);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      sessionDialog);
                            })),
                    (_sessionLink != null && _sessionLink.length > 0)
                        ? Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: OutlineButton(
                                child: Text('Slides'),
                                textColor: Colors.blue,
                                onPressed: () {
                                  if (_sessionLink != null &&
                                      _sessionLink.contains('http')) {
                                    // Use the dart:html window class to open a new browser window
                                    window.open(_sessionLink, _sessionLink);
                                  }
                                }))
                        : Container()
                  ])),
        ])));
  }

  void findSession(BuildContext context) {
    var sessions = StateWidget.of(context).state.sessions.values;
    _speakerSession.clear();
    sessions.forEach((session) {
      if (session.speakers.contains(_speaker.id)) {
        _speakerSession.add(session);
      }
    });
  }

  Dialog getDialog(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = _smallCard ? size.width : size.width / 2.5;

    return Dialog(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
          height: height,
          width: width,
          child: Scrollbar(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Image.asset(
                              '/icons/close.png',
                              height: _iconSize,
                              width: _iconSize,
                            ),
                          )),
                    ]),
                Padding(
                    padding: EdgeInsets.only(
                        top: 16, left: 16, bottom: 8, right: 16),
                    child: Container(
                        width: double.infinity,
                        height: height / 2.5,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                alignment: Alignment.center,
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    FirebaseCloudStorageURLResolver()
                                        .getCloudStorageURL(
                                            Constants.DEVFEST_BUCKET,
                                            _speaker.photoUrl)))))),
                Padding(
                    padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(_speaker.name + ', ' + _speaker.company,
                            style: Theme.of(context).textTheme.title),
                        for (Session session in _speakerSession)
                          (Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 16, bottom: 4),
                                    child: Text(session.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle)),
                                (session.description != null)
                                    ? Text(
                                        session.description,
                                        style:
                                            Theme.of(context).textTheme.body1,
                                        textAlign: TextAlign.justify,
                                      )
                                    : Container(),
                              ])),
                        Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 4),
                            child: Text('About ' + _speaker.name,
                                style: Theme.of(context).textTheme.subtitle)),
                        Text(
                          _speaker.bio,
                          style: Theme.of(context).textTheme.body1,
                          textAlign: TextAlign.justify,
                        )
                      ],
                    )),
                Padding(padding: EdgeInsets.only(top: 50.0)),
              ],
            ),
          ))),
    );
  }
}
