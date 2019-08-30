import 'package:flutter_web/material.dart';
import 'package:midevfest/models/timeslot.dart';
import '../../widgets/state_widget.dart';
import '../../models/speaker.dart';
import '../../models/track.dart';

class SessionsPageLargeBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Timeslot> _timeSlots = List<Timeslot>();
    StateWidget.of(context)
        .state
        .timeslots
        .forEach((key, timeslot) => {_timeSlots.add(timeslot)});

    List<Track> _tracks = List<Track>();
    _tracks = StateWidget.of(context).state.generalInfo.tracks;

    List<SessionInfo> _sessions = List<SessionInfo>();
    StateWidget.of(context).state.sessions.forEach(
        (key, session) => {_sessions.add(SessionInfo(session.id, context))});

    List<TimeSlotsWithSessions> _timeSlotsWithSessions =
        List<TimeSlotsWithSessions>();
    for (var timeslot in _timeSlots) {
      var timeSlotWithSessions = new TimeSlotsWithSessions(timeslot);
      for (var session in _sessions) {
        if (timeslot.sessions
            .toString()
            .contains(session.sessionId.toString())) {
          timeSlotWithSessions.addSession(session);
          print("Added session - " +
              session._sessionId.toString() +
              " to " +
              timeslot.startTime.toString());
        }
      }
      _timeSlotsWithSessions.add(timeSlotWithSessions);
    }

    // set the number of elements in the gridview crossaxis count
    int gridViewCount = 5;
    var size = MediaQuery.of(context).size;
    //make the cards 1/2 the height of the view
    final double _height = size.height;
    //make the card the scaled to the width divided by the number of gridview elements across
    final double _width = size.width;

    return Scrollbar(
        child: ListView(children: <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(24, 0, 8, 0),
          child: Text('Tentative Schedule',
              style: Theme.of(context).textTheme.headline)),
      Padding(
          padding: EdgeInsets.fromLTRB(24, 0, 8, 0),
          child: Text('(this will be finalized one week before the event)',
              style: Theme.of(context).textTheme.title)),
      Padding(
          padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Wrap(
            alignment: WrapAlignment.start,
            direction: Axis.horizontal,
            children: <Widget>[
              //TODO: Add scaling for text of this
              SizedBox(
                  width: _width / 5.5,
                  height: _height / 15,
                  child: Card(
                      color: Colors.lightBlueAccent,
                      child: Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: Text(
                            'Time Slot',
                            style: Theme.of(context).textTheme.title,
                          )))),
              for (var track in _tracks)
                SizedBox(
                    width: _width / 5.5,
                    height: _height / 15,
                    child: Card(
                      color: Colors.lightBlueAccent,
                      child: Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: Text(track.title,
                              style: Theme.of(context).textTheme.title)),
                    )),
              // Expanded()
            ],
          )),
      for (var timeslot in _timeSlotsWithSessions)
        Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Wrap(
              alignment: WrapAlignment.start,
              direction: Axis.horizontal,
              children: <Widget>[
                SizedBox(
                    width: _width / 5.5,
                    height: _height / 10,
                    child: Card(
                      color: Colors.lightBlue[100],
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            timeslot._timeslot.startTime +
                                ' - ' +
                                timeslot._timeslot.endTime,
                            style: Theme.of(context).textTheme.subtitle,
                          )),
                    )),
                for (var session in timeslot._sessions)
                  SizedBox(
                      width: _width / 5.5,
                      height: _height / 10,
                      child: Card(
                        color: Colors.lightBlue[100],
                        child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(session._sessionTitle,
                                style: Theme.of(context).textTheme.subtitle)),
                      )),
              ],
            ))
    ]));
  }

  String getSessionName(int sessionId, BuildContext context) {
    var sessions = StateWidget.of(context).state.sessions.values;
    sessions.forEach((session) {
      if (session.id == sessionId) {
        print("Found a session -> " + session.title);
        return session.title;
      }
    });
    return '';
  }

  String getSocialURL(String socialNetwork, Speaker speaker) {
    String url;
    speaker.socials.forEach((network) => url =
        (network.name == (socialNetwork)) ? network.link.toString() : url);
    return url;
  }
}

class SessionInfo {
  String _context;
  int _sessionId;
  List<int> _speakerId;
  String _sessionTitle;
  String _sessionDescription;
  String _speakerName = '';
  String _speakerCompany;
  String _speakerBio;

  int get sessionId => _sessionId;

  SessionInfo(this._sessionId, BuildContext _context) {
    var sessions = StateWidget.of(_context).state.sessions.values;
    _speakerId = new List<int>();
    sessions.forEach((session) {
      if (session.id == _sessionId) {
        _sessionTitle = session.title;
        _sessionDescription = session.description;
        _speakerId = session.speakers;
      }
    });
    for (var speakerId in _speakerId) {
      var speakers = StateWidget.of(_context).state.speakers.values;
      speakers.forEach((speaker) {
        if (speaker.id == speakerId) {
          _speakerName = _speakerName.isNotEmpty
              ? _speakerName + ', ' + speaker.name
              : speaker.name;
        }
      });
    }
  }
}

class TimeSlotsWithSessions {
  Timeslot _timeslot;
  List<SessionInfo> _sessions;

  TimeSlotsWithSessions(this._timeslot) {
    _sessions = List<SessionInfo>();
  }

  void addSession(SessionInfo session) {
    _sessions.add(session);
  }

  List<SessionInfo> getSessions() {
    return _sessions;
  }
}
