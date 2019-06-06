import 'package:flutter_web/material.dart';
import '../widgets/people_card_front.dart';
import '../widgets/card_with_image.dart';
import '../widgets/flip_card.dart';

class TeamPageSmallBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,    
      childAspectRatio: 0.8,

      children: <Widget>[
        FlipCard(
          direction: FlipDirection.VERTICAL, // default
          front: peopleCardView(
            name: 'Todd Deland',
            image: 'people/todd_deland.jpg',
            twitter: 'https://twitter.com/todddeland',
            github: 'https://github.com/mynameistodd',
            smallCard: true,
          ),
          back: Container(
            child: ImageCardView(image: '/logos/gdg_ann_arbor.jpeg'),
          ),
        ),
        FlipCard(
          direction: FlipDirection.VERTICAL,
          front: peopleCardView(
            name: 'Dave Koziol',
            image: 'people/dave_koziol.jpg',
            twitter: 'https://twitter.com/davekoziol',
            github: '',
            smallCard: true,
          ),
          back: Container(
            child: ImageCardView(image: '/logos/gdg_ann_arbor.jpeg'),
          ),
        ),
        FlipCard(
          direction: FlipDirection.VERTICAL,
          front: peopleCardView(
            name: 'Jingran Wang',
            image: 'people/jingran_wang.jpeg',
            twitter: 'https://twitter.com/hikaritenchi',
            github: 'https://github.com/hikaritenchi',
            smallCard: true,
          ),
          back: Container(
            child: ImageCardView(image: '/logos/gdg_ann_arbor.jpeg'),
          ),
        ),
        FlipCard(
          direction: FlipDirection.VERTICAL,
          front: peopleCardView(
            name: 'Don Ward',
            image: 'people/don_ward.jpg',
            twitter: 'https://twitter.com/donwardpeng',
            github: 'https://github.com/donwardpeng',
            smallCard: true,
          ),
          back: Container(
            child: ImageCardView(image: '/logos/gdg_detroit.png'),
          ),
        ),
        FlipCard(
          direction: FlipDirection.VERTICAL,
          front: peopleCardView(
            name: 'Scott Weber',
            image: 'people/scott_weber.jpg',
            twitter: 'https://twitter.com/ScottDWeber',
            github: 'https://github.com/scottdweber',
            smallCard: true,
          ),
          back: Container(
            child: ImageCardView(image: '/logos/gdg_ann_arbor.jpeg'),
          ),
        ),
      ],
    );
  }
}
