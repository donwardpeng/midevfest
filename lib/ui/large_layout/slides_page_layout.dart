import 'package:flutter_web/material.dart';
import '../../widgets/speaker_card_front.dart';
import '../../widgets/state_widget.dart';
import '../../models/speaker.dart';

class SlidesPageLargeBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Speaker> speakersList = List<Speaker>();
    StateWidget.of(context).state.speakers.forEach((key, speaker) => {
          if (speaker.sessionLink != null && speaker.sessionLink.length>0) {speakersList.add(speaker)}
        });

    // set the number of elements in the gridview crossaxis count
    int gridViewCount = 4;
    var size = MediaQuery.of(context).size;
    //make the cards 1/2 the height of the view
    final double cardHeight = size.height / 2;
    //make the card the scaled to the width divided by the number of gridview elements across
    final double cardWidth = size.width / gridViewCount;

    return Stack(children: <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 8, 36),
          child: Text('Slide Decks from our Speakers',
              style: Theme.of(context).textTheme.headline)),
      Padding(
          padding: EdgeInsets.fromLTRB(8, 84, 8, 0),
          child: Scrollbar(
              child: GridView.count(
                  crossAxisCount: gridViewCount,
                  childAspectRatio: (cardWidth / cardHeight),
                  children: speakersList
                      .map(
                        (speaker) => speakerCardView(
                          speaker: speaker,
                          twitter: getSocialURL('Twitter', speaker),
                          github: getSocialURL('GitHub', speaker),
                          smallCard: false,
                          parentWidth: cardWidth,
                          parentHeight: cardHeight,
                          sessionLink: speaker.sessionLink,
                        ),
                      )
                      .toList()))),
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
