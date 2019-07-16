import 'package:flutter_web/material.dart';
import '../../widgets/speaker_card_front.dart';
import '../../widgets/flip_card.dart';
import '../../widgets/state_widget.dart';
import '../../models/speaker.dart';

class SpeakerPageLargeBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Speaker> speakersList = new List<Speaker>();
    StateWidget.of(context)
        .state
        .speakers
        .forEach((key, speaker) => {speakersList.add(speaker)});

    return Stack(children: <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 8, 24),
          child: Text('Our Speakers',
              style: Theme.of(context).textTheme.headline)),
      Padding(
          padding: EdgeInsets.fromLTRB(8, 64, 8, 0),
          child: GridView.count(
              crossAxisCount: 3,
              children: speakersList
                  .map((speaker) => FlipCard(
                      direction: FlipDirection.VERTICAL, // default
                      front: speakerCardView(
                        speaker: speaker,
                        twitter: getSocialURL('Twitter', speaker),
                        github: getSocialURL('GitHub', speaker),
                        smallCard: false,
                      ),
                      back: Padding(
                          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                          child: Card(
                              child: Scrollbar(
                                  child: SingleChildScrollView(
                                      child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text('About ' + speaker.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle)),
                              Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(speaker.bio,
                                      style: Theme.of(context).textTheme.body1, textAlign: TextAlign.justify,))
                            ],
                          )))))))
                  .toList())),
    ]);
  }
  // ));}

  String getSocialURL(String socialNetwork, Speaker speaker) {
    String url;
    speaker.socials.forEach((network) => url =
        (network.name == (socialNetwork)) ? network.link.toString() : url);
    return url;
  }
}
