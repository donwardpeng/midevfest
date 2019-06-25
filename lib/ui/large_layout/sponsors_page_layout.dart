import 'package:flutter_web/material.dart';
import '../../widgets/people_card_front.dart';
import '../../widgets/card_with_image.dart';
import '../../widgets/flip_card.dart';
import '../../models/team_member.dart';
import '../../widgets/state_widget.dart';

class SponsorsPageLargeBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Padding(padding: EdgeInsets.fromLTRB(24, 8, 8, 4),child:
      Text('Sponsors', style: Theme.of(context).textTheme.headline)),
      Padding(padding: EdgeInsets.fromLTRB(8, 64, 8, 0),child:
      GridView.count(
        crossAxisCount: 3,
        // minAxisAlignment: MainAxisAlignment.center,
        children:         
        StateWidget.of(context).state.currentTeam.members.map((member) => 
          FlipCard(
            direction: FlipDirection.VERTICAL, // default
            front: peopleCardView(
              name: member.name,
              image: member.photoUrl,
              twitter: getSocialURL('Twitter', member),
              github: getSocialURL('GitHub', member),
              smallCard: false,
            ),
            back: Container(
              child: ImageCardView(image: member.gdgLogoUrl),
            ),
          ),
        ).toList()
      )),
    ]);
  }
  // ));}

  String getSocialURL(String socialNetwork, TeamMember member){
    String url;
    member.socials.forEach((network) => url = (network.name == (socialNetwork)) ? network.link.toString() : url);
    return url;
  }
}
