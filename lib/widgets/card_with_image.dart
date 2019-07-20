import 'package:flutter_web/material.dart';

class ImageCardView extends StatelessWidget {
  String _image;
  ImageCardView({String title, String image}) {
    _image = image;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Card(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Image.asset(_image)),
          ])),
    );
  }
}
