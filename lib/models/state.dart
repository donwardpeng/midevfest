import 'team.dart';
import 'sponsor_list.dart';
import 'package:flutter_web/material.dart';

class StateModel {
  String currentPage;
  Team currentTeam;
  SponsorList sponsorList;
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
