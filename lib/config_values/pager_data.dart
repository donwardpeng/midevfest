class IntroItem {
  IntroItem({
    this.title,
    this.category,
    this.imageUrl,
  });

  final String title;
  final String category;
  final String imageUrl;
}

final sampleItems = <IntroItem>[
  new IntroItem(title: 'Writing things together is what we do best!', category: 'COLLABORATION', imageUrl: 'devfest2018_photo_1.jpg',),
  new IntroItem(title: 'Occasionally wearing pants is a good idea.', category: 'CULTURE', imageUrl: 'devfest2018_photo_2.jpg',),
  new IntroItem(title: 'We might have the best team spirit ever.', category: 'SPIRIT', imageUrl: 'devfest2018_photo_3.jpg',),
];