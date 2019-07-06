import 'package:midevfest/models/schedule.dart';
import 'package:midevfest/models/sessions.dart';

import 'team.dart';
import 'sponsor_list.dart';
import 'package:flutter_web/material.dart';
import 'speakers.dart';

class StateModel {
  String currentPage;
  Team currentTeam;
  SponsorList sponsorList;
  Speakers speakerList;
  Sessions sessions;
  Schedule schedule;

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

  StateModel({
    this.currentPage = '',
  });
}
