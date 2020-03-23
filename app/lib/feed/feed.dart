import 'package:eventapp/feed/comments.dart';
import 'package:eventapp/feed/post.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    List<Post> posts = [
      Post(
        avatarUrl: 'https://picsum.photos/500/500',
        pictureUrl: 'https://picsum.photos/500/250',
        author: "Pyry Rouvila",
        text: 'Tosi tarttuva täyteteksti 🔥 ',
        timestamp: new DateTime.now().subtract(new Duration(minutes: 15)),
        comments: [
          Comment(
            author: 'Seppo taalasmaa',
            avatarUrl: 'https://picsum.photos/233/233',
            text: 'Tosi pitkä testi joka wrappaa. Tosi pitkä testi joka wrappaa. Tosi pitkä testi joka wrappaa. Tosi pitkä testi joka wrappaa. Tosi pitkä testi joka wrappaa.'
          ),
          Comment(
            author: 'Kalle Hirvola',
            avatarUrl: 'https://picsum.photos/500/500',
            text: 'Emoji kommentti 😎'
          ),
          Comment(
              author: 'Kalle Hirvola',
              avatarUrl: 'https://picsum.photos/500/500',
              text: 'Emoji kommentti 2 😎'
          ),
          Comment(
              author: 'Kalle Hirvola',
              avatarUrl: 'https://picsum.photos/500/500',
              text: 'Emoji kommentti 3 😎'
          ),
        ]
      ),
      Post(
        pictureUrl: 'https://picsum.photos/333/250',
        avatarUrl: 'https://picsum.photos/500/500',
        text: 'Bussikyyti jatkoille lähtee NYT! Vikatkin messiin ja tanssijalka vipattamaan 😎😎',
        author: "Sanna Marin",
        timestamp: new DateTime.now().subtract(new Duration(minutes: 15)),
      ),
      Post(
        avatarUrl: 'https://picsum.photos/200/200',
        pictureUrl: 'https://picsum.photos/499/250',
        author: "Paavo Lipponen",
        timestamp: new DateTime.now().subtract(new Duration(minutes: 12)),
      ),
    ];

    return Scrollbar(
      child: ListView.builder(
        padding: EdgeInsets.all(22.0),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              posts[index],
              index != posts.length - 1 ? SizedBox(height: 28) : Container(),
            ],
          );
        },
      ),
    );
  }
}

