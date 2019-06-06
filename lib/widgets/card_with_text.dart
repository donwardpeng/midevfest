import 'package:flutter_web/material.dart';
import 'dart:html';

class TextCardView extends StatelessWidget {
  String _title;
  String _text;
  TextCardView({String title, String text}) {
    _title = title;
    _text = text;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Card(
          child: Column(children: <Widget>[
        Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5), child: Text(_title)),
        Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5), child: Text(_text)),
      ])),
    );
  }
}
