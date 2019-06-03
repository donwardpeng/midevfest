import 'package:flutter_web/material.dart';
import '../widgets/people_cardview.dart';

class TeamPageLargeBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    peopleCardView(
                        name: 'Todd Deland', image: 'people/todd_deland.jpg'),
                    peopleCardView(
                        name: 'Dave Koziol', image: 'people/dave_koziol.jpg'),
                    peopleCardView(
                        name: 'Jingran Wang',
                        image: 'people/jingran_wang.jpeg'),
                    peopleCardView(
                        name: 'Don Ward', image: 'people/don_ward.jpg'),
                    peopleCardView(
                        name: 'Scott Weber', image: 'people/scott_weber.jpg'),
                  ],
                ))
          ],
        ));
  }
}
