import 'package:flutter_web/material.dart';
import '../../widgets/people_card_front.dart';
import '../../widgets/card_with_image.dart';
import '../../widgets/flip_card.dart';
import '../../models/team_member.dart';
import '../../widgets/state_widget.dart';

class TeamPageSmallBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,    
      childAspectRatio: 0.9,

      children: StateWidget.of(context).state.currentTeam.members.map((member) => 
          FlipCard(
            direction: FlipDirection.VERTICAL, // default
            front: peopleCardView(
              name: member.name,
              image: member.photoUrl,
              twitter: getSocialURL('Twitter', member),
              github: getSocialURL('GitHub', member),
              smallCard: true,
            ),
            back: Container(
              child: ImageCardView(image: member.gdgLogoUrl),
            ),
          ),
        ).toList()
    );
  }

  String getSocialURL(String socialNetwork, TeamMember member){
    String url;
    member.socials.forEach((network) => url = (network.name == (socialNetwork)) ? network.link.toString() : url);
    return url;
  }

}
