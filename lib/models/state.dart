import 'package:midevfest/models/general_info.dart';

import 'team.dart';
import 'sponsor_list.dart';
import 'package:flutter_web/material.dart';
import 'speaker.dart';
import 'session.dart';
import 'timeslot.dart';

class StateModel {
  String currentPage;
  Team currentTeam;
  SponsorList sponsorList;
  Map<int, Speaker> speakers; //key = id
  Map<int, Session> sessions; //key = id
  GeneralInfo generalInfo;
  Map<String, Timeslot> timeslots; //key = start time
  bool _hasDisplayedMainScreen = false;

  final double largeBreakPoint = 800.0;
  final double mediumBreakPoint = 600.0;

  bool isSmallScreen(context) {
    final smallestWidth = MediaQuery.of(context).size.shortestSide;
    if (smallestWidth >= largeBreakPoint || smallestWidth >= mediumBreakPoint) {
      return false;
    } else {
      return true;
    }
  }

  void setHasDisplayedMainScreenTrue(){
    _hasDisplayedMainScreen = true;
  }

  bool hasDisplayedMainScreen(){
    return _hasDisplayedMainScreen;
  }

  StateModel({
    this.currentPage = '',
  });
}
