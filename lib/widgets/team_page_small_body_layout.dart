import 'package:flutter_web/material.dart';
import '../widgets/people_cardview.dart';

class TeamPageSmallBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
       peopleCardView(
                        name: 'Todd Deland', image: 'people/todd_deland.jpg', twitter: 'https://twitter.com/todddeland', github: 'https://github.com/mynameistodd',),
                    peopleCardView(
                        name: 'Dave Koziol', image: 'people/dave_koziol.jpg', twitter: 'https://twitter.com/davekoziol', github: '',),
                    peopleCardView(
                        name: 'Jingran Wang',
                        image: 'people/jingran_wang.jpeg', twitter: 'https://twitter.com/hikaritenchi', github: 'https://github.com/hikaritenchi',),
                    peopleCardView(
                        name: 'Don Ward', image: 'people/don_ward.jpg', twitter: 'https://twitter.com/donwardpeng', github: 'https://github.com/donwardpeng',),
                    peopleCardView(
                        name: 'Scott Weber', image: 'people/scott_weber.jpg', twitter: 'https://twitter.com/ScottDWeber', github: 'https://github.com/scottdweber',),
      ],
    )));
  }
}
