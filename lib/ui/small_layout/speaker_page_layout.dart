import 'package:flutter_web/material.dart';
import '../../widgets/speaker_card_front.dart';
import '../../widgets/state_widget.dart';
import '../../models/speaker.dart';

class SpeakerPageSmallBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Speaker> speakersList = List<Speaker>();
    StateWidget.of(context)
        .state
        .speakers
        .forEach((key, speaker) => {speakersList.add(speaker)});

// set the number of elements in the gridview crossaxis count
    int gridViewCount = 1;
    var size = MediaQuery.of(context).size;
    //make the cards the height of the view
    final double cardHeight = size.height/2;
    //make the card the scaled to the width divided by the number of gridview elements across
    final double cardWidth = size.width / gridViewCount;

    return Stack(children: <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 8, 24),
          child: Text('Our Speakers',
              style: Theme.of(context).textTheme.headline)),
      Padding(
          padding: EdgeInsets.fromLTRB(8, 84, 8, 0),
          child: GridView.count(
              crossAxisCount: gridViewCount,
              childAspectRatio: (cardWidth / cardHeight),
              children: speakersList
                  .map(
                    (speaker) => speakerCardView(
                      speaker: speaker,
                      twitter: getSocialURL('Twitter', speaker),
                      github: getSocialURL('GitHub', speaker),
                      smallCard: true,
                      parentWidth: cardWidth,
                      parentHeight: cardHeight,
                    ),
                  )
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
