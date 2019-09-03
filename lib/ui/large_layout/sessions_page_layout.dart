import 'package:flutter_web/material.dart';
import 'package:midevfest/models/session.dart';
import 'package:midevfest/models/timeslot.dart';
import '../../widgets/state_widget.dart';
import '../../models/speaker.dart';
import '../../models/track.dart';
import '../../helper/firebase_cloud_storage_resolver.dart';
import '../../values/constants.dart';

class SessionsPageLargeBodyWidget extends StatelessWidget {
  double _heightToShrink = 800;
  double _ShrinkFactor = 1;

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

      print('Sessions = ' + timeslot.sessions.toString());

      for (var nextSessionToAdd in timeslot.sessions) {
        print('next session = ' + nextSessionToAdd.toString());
        for (var session in _sessions) {
          if (nextSessionToAdd
              .toString()
              .contains(session.sessionId.toString())) {
            timeSlotWithSessions.addSession(session);
            print("Added session - " +
                session._sessionId.toString() +
                " to " +
                timeslot.startTime.toString());
          }
        }
      }
      _timeSlotsWithSessions.add(timeSlotWithSessions);
    }

    var size = MediaQuery.of(context).size;
    //make the cards 1/2 the height of the view
    final double _height = size.height;
    //make the card the scaled to the width divided by the number of gridview elements across
    final double _width = size.width;

    _ShrinkFactor = (1 - ((_heightToShrink - _height) / _heightToShrink));

    return Scrollbar(
        child: ListView(children: <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(24, 0, 8, 0),
          child: Text('Tentative Schedule',
              style: Theme.of(context).textTheme.headline)),
      Padding(
          padding: EdgeInsets.fromLTRB(24, 0, 8, 20),
          child: Text('(this will be finalized one week before the event)',
              style: Theme.of(context).textTheme.title)),
      Padding(
          padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Wrap(
            alignment: WrapAlignment.start,
            direction: Axis.horizontal,
            children: <Widget>[
              SizedBox(
                  width: _width / 5.5,
                  height: _height / 12,
                  child: Card(
                      color: Colors.lightBlueAccent,
                      child: Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: Text('Time Slot',
                              style: Theme.of(context).textTheme.title.apply(
                                  fontSizeFactor: 1.0 * _ShrinkFactor))))),
              for (var track in _tracks)
                SizedBox(
                    width: _width / 5.5,
                    height: _height / 12,
                    child: Card(
                      color: Colors.lightBlueAccent,
                      child: Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: Text(track.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .title
                                  .apply(fontSizeFactor: 1.0 * _ShrinkFactor))),
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
                    height: (timeslot._sessions.length > 1)
                        ? (_height / 4)
                        : (_height / 12),
                    child: Card(
                      color: Colors.lightBlue[100],
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            timeslot._timeslot.startTime +
                                ' - ' +
                                timeslot._timeslot.endTime,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .apply(fontSizeFactor: 1.0 * _ShrinkFactor),
                          )),
                    )),
                for (var session in timeslot._sessions)
                  SizedBox(
                      width: (timeslot._sessions.length == 1)
                          ? (_width / (5.5 / 4))
                          : (_width / 5.5),
                      height: (timeslot._sessions.length > 1)
                          ? (_height / 4)
                          : (_height / 12),
                      child: Card(
                          color: Colors.lightBlue[100],
                          child: InkWell(
                            onTap: () {
                              if (timeslot._sessions.length > 1) {
                                print(session._sessionTitle);
                                Dialog sessionDialog =
                                    getDialog(context, session);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        sessionDialog);
                              }
                            },
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                    (timeslot._sessions.length == 1)
                                        ? (session._sessionTitle)
                                        : (session._sessionTitle +
                                            ' by ' +
                                            session._sessionSpeakerList),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle
                                        .apply(
                                            fontSizeFactor:
                                                1.0 * _ShrinkFactor))),
                          ))),
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
  String _sessionSpeakerList = '';
  List<String> _speakerNameAndBio = new List<String>();
  List<String> _speakerCompany = new List<String>();
  List<String> _speakerBio = new List<String>();
  List<String> _speakerPhotoURL = new List<String>();

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
          _speakerNameAndBio.add(speaker.name + '\n\n' + speaker.bio);
          _speakerCompany.add(speaker.company);
          _speakerPhotoURL.add(speaker.photoUrl);
          _speakerBio.add(speaker.bio);
          _sessionSpeakerList = _sessionSpeakerList.isNotEmpty
              ? _sessionSpeakerList + ' and ' + speaker.name
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

Dialog getDialog(BuildContext context, SessionInfo session) {
  var size = MediaQuery.of(context).size;
  final double height = size.height;
  final double width = size.width / 2.5;
  double _iconSize = 36;
  // _smallCard ? size.width: size.width / 2.5;

  print('In Dialog - session = ' + session._sessionTitle);
  return Dialog(
    elevation: 8,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    child: Container(
        height: height,
        width: width,
        child: Scrollbar(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Image.asset(
                        '/icons/close.png',
                        height: _iconSize,
                        width: _iconSize,
                      ),
                    )),
              ]),
              //handle multiple speakers for the speaker image
              Row(children: <Widget>[
                for (var speakerPhotoURL in session._speakerPhotoURL)
                  Padding(
                      padding: EdgeInsets.only(
                          top: 16, left: 4, bottom: 8, right: 4),
                      child: Container(
                          width: (width - 20) / session._speakerPhotoURL.length,
                          height: height / 2.5,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      FirebaseCloudStorageURLResolver()
                                          .getCloudStorageURL(
                                              Constants.DEVFEST_BUCKET,
                                              speakerPhotoURL)))))),
              ]),
              Padding(
                  padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(session._sessionSpeakerList,
                          style: Theme.of(context).textTheme.title),
                      (Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(top: 16, bottom: 4),
                                child: Text(session._sessionTitle,
                                    style:
                                        Theme.of(context).textTheme.subtitle)),
                            (session._sessionDescription != null)
                                ? Text(
                                    session._sessionDescription,
                                    style: Theme.of(context).textTheme.body1,
                                    textAlign: TextAlign.justify,
                                  )
                                : Container(),
                          ])),
                      for (var speakerNameAndBio in session._speakerNameAndBio)
                        Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 4),
                            child: Text('About ' + speakerNameAndBio,
                                style: Theme.of(context).textTheme.body1)),
                    ],
                  )),
              Padding(padding: EdgeInsets.only(top: 50.0)),
            ],
          ),
        ))),
  );
}
