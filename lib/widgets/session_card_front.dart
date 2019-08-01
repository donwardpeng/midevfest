import 'package:flutter_web/material.dart';
import 'dart:html';
import '../helper/firebase_cloud_storage_resolver.dart';
import '../values/constants.dart';
import '../models/speaker.dart';
import '../widgets/state_widget.dart';
import '../models/session.dart';

class sessionCardView extends StatelessWidget {
  final double SMALL_ICON_SIZE = 30;
  final double LARGE_ICON_SIZE = 36;
  double _iconSize;
  Speaker _speaker;
  bool _smallCard;
  String _twitter;
  String _github;
  Session _speakerSession;
  double _parentWidth;
  double _parentHeight;


  speakerCardView(
      {Speaker speaker, String twitter, String github, bool smallCard, parentWidth, parentHeight}) {
    _speaker = speaker;
    _twitter = twitter;
    _github = github;
    _smallCard = smallCard;
    _iconSize = _smallCard ? SMALL_ICON_SIZE : LARGE_ICON_SIZE;
    _parentWidth = parentWidth;
    _parentHeight = parentHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        //outer padding for Cardview
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Card(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
          Padding(
              padding: EdgeInsets.only(top: 8, left: 24, bottom: 8, right: 24),
              child: Container(
                  width: _parentWidth - 48,
                  height: _parentHeight/3,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(FirebaseCloudStorageURLResolver()
                              .getCloudStorageURL(Constants.DEVFEST_BUCKET,
                                  _speaker.photoUrl)))))),
          Padding(
              padding: EdgeInsets.only(bottom: 16, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_speaker.name, style: Theme.of(context).textTheme.title),
                  Text(_speaker.company,
                      style: Theme.of(context).textTheme.subtitle),
                ],
              )),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
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
                    onPressed: () {
                      findSession(context);
                      Dialog sessionDialog = Dialog(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        //this right here
                        child: Container(
                            height: 500.0,
                            width: 500.0,
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
                                              padding: EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: Image.asset(
                                                '/icons/close.png',
                                                height: _iconSize,
                                                width: _iconSize,
                                              ),
                                            )),
                                      ]),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 16,
                                          left: 16,
                                          bottom: 8,
                                          right: 16),
                                      child: Container(
                                          width: double.infinity,
                                          height: 300,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              image: DecorationImage(
                                                  fit: BoxFit.fitWidth,
                                                  image: NetworkImage(
                                                      FirebaseCloudStorageURLResolver()
                                                          .getCloudStorageURL(
                                                              Constants
                                                                  .DEVFEST_BUCKET,
                                                              _speaker
                                                                  .photoUrl)))))),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 16, left: 16, right: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                              _speaker.name +
                                                  ', ' +
                                                  _speaker.company,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .title),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 4, bottom: 4),
                                              child: Text(_speakerSession.title,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle)),
                                          (_speakerSession.description != null)
                                              ? Text(
                                                  _speakerSession.description,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .body1,
                                                  textAlign: TextAlign.justify,
                                                )
                                              : Container(),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 16, bottom: 4),
                                              child: Text(
                                                  'About ' + _speaker.name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle)),
                                          Text(
                                            _speaker.bio,
                                            style: Theme.of(context)
                                                .textTheme
                                                .body1,
                                            textAlign: TextAlign.justify,
                                          )
                                        ],
                                      )),
                                  Padding(padding: EdgeInsets.only(top: 50.0)),
                                ],
                              ),
                            ))),
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => sessionDialog);
                    }))
          ])
        ])));
  }

  void findSession(BuildContext context) {
    var sessions = StateWidget.of(context).state.sessions.values;
    sessions.forEach((session) {
      if (session.speakers.contains(_speaker.id)) {
        _speakerSession = session;
      }
    });
    //(f)=>print('Found non null speakers - ' + f.speakers.toString()));
  }
}
