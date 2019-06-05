import 'package:flutter_web/material.dart';
import 'dart:html';

class peopleCardView extends StatelessWidget {
  String _name;
  String _image;
  String _twitter;
  String _github;
  peopleCardView({String name, String image, String twitter, String github}) {
    _name = name;
    _image = image;
    _twitter = twitter;
    _github = github;

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Card(
            child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                  width: 125.0,
                  height: 125.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill, image: AssetImage(_image))))),
          Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5), child: Text(_name)),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Image.asset('twitter.png', height: 32, width: 32,),
                    onPressed: () {window.open(_twitter, 'Twitter');},
                  ),
                  _github.contains('github') ? FlatButton(
                    child: Image.asset('github.png', height: 32, width: 32,),
                    onPressed: () {window.open(_github, 'Github');},
                  ) : Container(),
                ],
              ))
        ])));
  }
}
