import 'package:flutter_web/material.dart';
import 'dart:html';

class peopleCardView extends StatelessWidget {
  final double SMALL_ICON_SIZE = 30;
  final double LARGE_ICON_SIZE = 36;
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
                  width: 150.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill, image: AssetImage(_image))))),
          Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5), child: Text(_name)),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    child: Image.asset(
                      'twitter.png',
                      height: _iconSize,
                      width: _iconSize,
                    ),
                    onTap: () {
                      window.open(_twitter, 'Twitter');
                    },
                  ),
                  _github.contains('github')
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
        ])));
  }
}
