import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Feed',
            style: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.w300),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.menu), onPressed: () {})
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Image.network(
                'https://painted.com/wp-content/uploads/2019/08/van-goghself-portrait-1889-artemazeh.jpg',
                fit: BoxFit.fill),
            Image.network(
                'https://painted.com/wp-content/uploads/2019/08/van-gogh-starry-night-1889-h-gillianchapmanfelts.jpg',
                fit: BoxFit.fill),
            Image.network(
                'https://painted.com/wp-content/uploads/2019/08/Vincent_van_Gogh_-_Tuin_in_Montmartre_met-Garden-in-Montmarte-with-lovers-1887-vangogh-vincent.jpg',
                fit: BoxFit.fill),
            Image.network(
                'https://painted.com/wp-content/uploads/2019/08/van-gogh-almond-blossoms-1890-askatma.jpg',
                fit: BoxFit.fill),
            Image.network(
                'https://painted.com/wp-content/uploads/2019/08/van_Gogh__The_Church_at_Auvers__1890-festival-auver.jpg',
                fit: BoxFit.fill),
            Image.network(
                'https://painted.com/wp-content/uploads/2019/08/van-gogh-cafe-terrace-at-night-1888-vincent-van-gogh-sartle..jpg',
                fit: BoxFit.fill),
            Image.network(
                'https://painted.com/wp-content/uploads/2019/08/Claude_MonetThe-Magpie-1869-leseg.wordpress.jpg',
                fit: BoxFit.fill),
            Image.network(
                'https://painted.com/wp-content/uploads/2019/08/Claude_Monet-Impression-Sunrise-1872-scienzament.jpg',
                fit: BoxFit.fill),
            Image.network(
                'https://painted.com/wp-content/uploads/2019/08/van-goghself-The-Pink-Peach-Tree-1888-3x4.jpg',
                fit: BoxFit.fill),
            Image.network(
                'https://painted.com/wp-content/uploads/2019/08/Claude_Monet-The-Terrace-at-Sainte-Adresse-1866-editart.jpg',
                fit: BoxFit.fill),
            Image.network(
                'https://painted.com/wp-content/uploads/2019/08/Claude_Monet-woman-with-a-parasol-madame-monet-and-her-son-1875-artsandculture.jpg',
                fit: BoxFit.fill),
            Image.network(
                'https://painted.com/wp-content/uploads/2019/08/Claude_Monet-Three-Trees-in-Grey-Weather-1891-postergrad.jpg',
                fit: BoxFit.fill),
          ],
        ));
  }
}
