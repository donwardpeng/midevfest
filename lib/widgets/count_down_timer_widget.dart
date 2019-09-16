import 'package:flutter_web/material.dart';
import 'dart:async';

class CountDownWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CountDownWidgetState();
  }
}

class CountDownWidgetState extends State<CountDownWidget> {
  Timer _countDownTimer;
  DateTime dateOfDevFest = DateTime.parse("2019-09-21 8:00:00Z");

  void startCountDown() {
    const oneSec = const Duration(seconds: 1);
    _countDownTimer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(() {
        Duration diff = dateOfDevFest.difference(DateTime.now());
        print(diff.inDays.toString() +
            " Days " +
            diff.inHours.toString() +
            " Hours " +
            diff.inMinutes.toString() +
            " Minutes " +
            diff.inSeconds.toString() +
            " seconds");
      }),
    );
  }

  @override
  void initState() {
    startCountDown();
  }

  @override
  Widget build(BuildContext context) {
    return Text("cdcdc");
  }

  @override
  void dispose() {
    _countDownTimer.cancel();
  }
}
