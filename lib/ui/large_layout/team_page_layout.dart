import 'package:flutter_web/material.dart';
import '../../widgets/people_card_front.dart';
import '../../widgets/card_with_image.dart';
import '../../widgets/flip_card.dart';
import '../../models/team_member.dart';
import '../../widgets/state_widget.dart';

class TeamPageLargeBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // set the number of elements in the gridview crossaxis count
    int gridViewCount = 4;
    var size = MediaQuery.of(context).size;
    //make the cards 1/2 the height of the view
    final double cardHeight = size.height / 2;
    //make the card the scaled to the width divided by the number of gridview elements across
    final double cardWidth = size.width / gridViewCount;

    return Stack(children: <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 8, 4),
          child: Text('The Team', style: Theme.of(context).textTheme.headline)),
      Padding(
          padding: EdgeInsets.fromLTRB(8, 72, 8, 0),
          child: GridView.count(
              crossAxisCount: gridViewCount,
              childAspectRatio: (cardWidth / cardHeight),
              children: StateWidget.of(context)
                  .state
                  .currentTeam
                  .members
                  .map(
                    (member) => FlipCard(
                      direction: FlipDirection.VERTICAL, // default
                      front: peopleCardView(
                        name: member.name,
                        image: member.photoUrl,
                        twitter: getSocialURL('Twitter', member),
                        github: getSocialURL('GitHub', member),
                        smallCard: false,
                        height: cardHeight,
                        width: cardWidth,
                      ),
                      back: Container(
                        child: ImageCardView(image: member.gdgLogoUrl),
                      ),
                    ),
                  )
                  .toList())),
    ]);
  }

  // ));}

  String getSocialURL(String socialNetwork, TeamMember member) {
    String url;
    member.socials.forEach((network) => url =
        (network.name == (socialNetwork)) ? network.link.toString() : url);
    return url;
  }
}
