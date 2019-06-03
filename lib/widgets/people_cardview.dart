import 'package:flutter_web/material.dart';

class peopleCardView extends StatelessWidget {
  String _name;
  String _image;

  peopleCardView({String name, String image}) {
    _name = name;
    _image = image;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: <Widget>[
      Padding(
          padding: EdgeInsets.all(15),
          child: Container(
              width: 125.0,
              height: 125.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(_image))))),
      Text(_name)
    ]));
  }
}
