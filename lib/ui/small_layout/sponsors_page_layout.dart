import 'package:flutter_web/material.dart';
import '../../widgets/state_widget.dart';
import 'package:midevfest/models/sponsor.dart';
import 'package:midevfest/models/sponsor_level.dart';
import '../../models/state.dart';
import 'dart:html';
import '../../helper/firebase_cloud_storage_resolver.dart';
import '../../values/constants.dart';


class SponsorsPageSmallBodyWidget extends StatelessWidget {
  StateModel appState;

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
        var size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;

    //populate list of financial sponsors
    List<Sponsor> financialSponsors = List<Sponsor>();
    for(SponsorLevel level in appState.sponsorList.levels) {
      if(level.title.contains('Financial')){
        for(Sponsor sponsor in level.logos){
        financialSponsors.add(sponsor);
        }
      }
    }
    //populate list of financial sponsors
    List<Sponsor> communityPartners = List<Sponsor>();
    for(SponsorLevel level in appState.sponsorList.levels) {
      if(level.title.contains('Community')){
        for(Sponsor partner in level.logos){
        communityPartners.add(partner);
        }
      }
    }

return Scrollbar(child:ListView(children: <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(24, 16, 8, 16),
          child: Text('Thank you to our sponsors!', style: Theme.of(context).textTheme.display1)),
      Padding(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
          child:
      GridView.count(
              crossAxisCount: 1,
              shrinkWrap: true,
              children: financialSponsors
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
                                width: double.infinity,
                                height: height/3,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      )))
                  .toList())),
        Padding(
          padding: EdgeInsets.fromLTRB(24, 16, 8, 16),
          child: Text('Thank you to our community partners!', style: Theme.of(context).textTheme.display1)),
       Padding(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
          child:
      GridView.count(
              crossAxisCount: 1,
              shrinkWrap: true,
              children: communityPartners
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
                                width: double.infinity,
                                height: height/3,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      )))
                  .toList())),
    ]));
  }

}
