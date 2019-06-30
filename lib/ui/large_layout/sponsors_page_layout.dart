import 'package:flutter_web/material.dart';
import '../../widgets/people_card_front.dart';
import '../../widgets/card_with_image.dart';
import '../../widgets/flip_card.dart';
import '../../widgets/state_widget.dart';
import '../../models/state.dart';

class SponsorsPageLargeBodyWidget extends StatelessWidget {
  StateModel appState;

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    print('Building Large Body Widget');
    print(
        'Results for StateWidget SponsorsList - ' + appState.sponsorList.title);
    return Stack(children: <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 8, 4),
          child: Text('Sponsors', style: Theme.of(context).textTheme.headline)),
      Padding(
          padding: EdgeInsets.fromLTRB(8, 64, 8, 0),
          child: GridView.count(
              crossAxisCount: 3,
              // minAxisAlignment: MainAxisAlignment.center,
              children: appState.sponsorList.levels[0].logos
                  .map(
                    (sponsor) => FlipCard(
                          direction: FlipDirection.VERTICAL, // default
                          front: peopleCardView(
                            name: sponsor.name,
                            image: sponsor.logoUrl,
                            smallCard: false,
                          ),
                          back: Container(
                            child: ImageCardView(image: sponsor.logoUrl),
                          ),
                        ),
                  )
                  .toList())),
    ]);
  }
  // ));}

}
