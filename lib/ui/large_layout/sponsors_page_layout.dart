import 'package:flutter_web/material.dart';
import '../../widgets/state_widget.dart';
import '../../models/state.dart';
import 'dart:html';

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
          padding: EdgeInsets.fromLTRB(24, 8, 8, 16),
          child: Text('Sponsors', style: Theme.of(context).textTheme.headline)),
      Padding(
          padding: EdgeInsets.fromLTRB(8, 64, 8, 24),
          child: GridView.count(
              crossAxisCount: 3,
              children: appState.sponsorList.levels[0].logos
                  .map((sponsor) => InkWell(
                      onTap: () {
                        window.open(sponsor.url, sponsor.name);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Card(
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                sponsor.logoUrl,
                                width: sponsor.width.roundToDouble(),
                                height: sponsor.height.roundToDouble(),
                                alignment: Alignment.center,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
                                child: Text(sponsor.name,
                                    style: Theme.of(context).textTheme.body1),
                              )
                            ],
                          ),
                        ),
                      )))
                  .toList())),
    ]);
  }
  // ));}

}
