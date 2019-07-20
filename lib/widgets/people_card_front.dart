import 'package:flutter_web/material.dart';
import 'dart:html';
import '../helper/firebase_cloud_storage_resolver.dart';
import '../values/constants.dart';

class peopleCardView extends StatelessWidget {
  final double SMALL_ICON_SIZE = 30;
  final double LARGE_ICON_SIZE = 36;
  double _headshotSize;
  double _iconSize;
  String _name;
  String _image;
  String _twitter;
  String _github;
  bool _smallCard;

  peopleCardView(
      {String name,
      String image,
      String twitter,
      String github,
      bool smallCard}) {
    _name = name;
    _image = image;
    _twitter = twitter;
    _github = github;
    _smallCard = smallCard;
    _iconSize = _smallCard ? SMALL_ICON_SIZE : LARGE_ICON_SIZE;
    _headshotSize = smallCard ? 200 : 175;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Card(
            child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                  width: double.infinity,
                  height: _headshotSize,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(FirebaseCloudStorageURLResolver()
                              .getCloudStorageURL(
                                  Constants.DEVFEST_BUCKET, _image)))))),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Text(_name, style: Theme.of(context).textTheme.title)),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  InkWell(
                    child: Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Image.asset(
                          '/icons/more_vert.png',
                          height: _iconSize,
                          width: _iconSize,
                        )),
                  ),
                ],
              )),
        ])));
  }
}
