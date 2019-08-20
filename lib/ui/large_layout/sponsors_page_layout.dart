import 'package:flutter_web/material.dart';
import '../../widgets/state_widget.dart';
import '../../models/state.dart';
import 'dart:html';
import '../../helper/firebase_cloud_storage_resolver.dart';
import '../../values/constants.dart';

class SponsorsPageLargeBodyWidget extends StatelessWidget {
  StateModel appState;

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    var size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;

    print('Building Large Body Widget');
    print(
        'Results for StateWidget SponsorsList - ' + appState.sponsorList.title);
    return Stack(children: <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 8, 16),
          child: Text('Thank you to our sponsors!', style: Theme.of(context).textTheme.headline)),
      Padding(
          padding: EdgeInsets.fromLTRB(8, 84, 8, 24),
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
                              Image.network(
                                FirebaseCloudStorageURLResolver().getCloudStorageURL(Constants.DEVFEST_BUCKET, sponsor.logoUrl),
                                // width: sponsor.width.roundToDouble(),
                                // height: sponsor.height.roundToDouble(),
                                width: double.infinity,
                                height: height/3,
                                alignment: Alignment.center,
                              ),
                              // Padding(
                              //   padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                              //   child: Text(sponsor.name,
                              //       style: Theme.of(context).textTheme.title),
                              // )
                            ],
                          ),
                        ),
                      )))
                  .toList())),
    ]);
  }
  // ));}

}
