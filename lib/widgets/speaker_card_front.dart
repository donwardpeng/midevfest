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
    _headshotSize = smallCard ? 80 : 300;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        //outter padding for Cardview
        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Card(  
            child: ListView(children: <Widget>[
          Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                  width: _headshotSize,
                  height: _headshotSize,
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: NetworkImage(FirebaseCloudStorageURLResolver()
                              .getCloudStorageURL(Constants.DEVFEST_BUCKET,
                                  _speaker.photoUrl)))))),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(_speaker.name,
                        style: Theme.of(context).textTheme.title)),
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(_speaker.company,
                        style: Theme.of(context).textTheme.subtitle)),
                // Padding(
                //     padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                //     child: Text(_speaker.shortBio,
                //         style: Theme.of(context).textTheme.body1)),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        (_twitter != null && _twitter.contains('twitter'))
                            ? InkWell(
                                child: Image.asset(
                                  'twitter.png',
                                  height: _iconSize,
                                  width: _iconSize,
                                ),
                                onTap: () {
                                  window.open(_twitter, 'Twitter');
                                },
                              )
                            : Container(),
                        (_github != null && _github.contains('github'))
                            ? InkWell(
                                child: Image.asset(
                                  'github.png',
                                  height: _iconSize,
                                  width: _iconSize,
                                ),
                                onTap: () {
                                  window.open(_github, 'Github');
                                },
                              )
                            : Container(),
                        InkWell(
                          child: Image.asset(
                            '/icons/more_vert.png',
                            height: _iconSize,
                            width: _iconSize,
                          ),
                        ),
                      ],
                    )),
              ])
        ])));
  }
}
