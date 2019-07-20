import 'package:flutter_web/material.dart';
import 'dart:html';
import '../helper/firebase_cloud_storage_resolver.dart';
import '../values/constants.dart';
import '../models/speaker.dart';

class speakerCardView extends StatelessWidget {
  final double SMALL_ICON_SIZE = 30;
  final double LARGE_ICON_SIZE = 36;
  double _iconSize;
  double _headshotSize;
  Speaker _speaker;
  bool _smallCard;
  String _twitter;
  String _github;

  speakerCardView(
      {Speaker speaker, String twitter, String github, bool smallCard}) {
    _speaker = speaker;
    _twitter = twitter;
    _github = github;
    _smallCard = smallCard;
    _iconSize = _smallCard ? SMALL_ICON_SIZE : LARGE_ICON_SIZE;
    _headshotSize = smallCard ? 200 : 175;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        //outter padding for Cardview
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Card(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 8, left: 24, bottom: 8, right: 24),
                  child: Container(
                      width: double.infinity,
                      height: _headshotSize,
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
                  child: InkWell(
                    child: Image.asset(
                      '/icons/more_vert.png',
                      height: _iconSize,
                      width: _iconSize,
                    ),
                  ),
                )
              ])
            ])));
  }
}
