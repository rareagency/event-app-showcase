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
        postText: 'Bussikyyti jatkoille lähtee NYT! Vikatkin messiin ja tanssijalka vipattamaan 😎😎',
        author: "Pyry Rouvila",
        timestamp: new DateTime.now().subtract(new Duration(minutes: 15)),
        comments: [
          Comment(
            author: 'Matti Meikäläinen',
            avatarUrl: 'https://picsum.photos/233/233',
            text: 'Tässä on tosi pitkä teksti joka valuu yli Tässä on tosi pitkä teksti joka valuu yli Tässä on tosi pitkä teksti joka valuu yli'
          ),
          Comment(
            author: 'Teppo Teikäläinen',
            avatarUrl: 'https://picsum.photos/235/233',
            text: 'Nauraa'
          ),
          Comment(
            author: 'Soivio',
            avatarUrl: 'https://picsum.photos/232/233',
            text: ':D'
          ),
        ]
      ),
      Post(
        avatarUrl: 'https://picsum.photos/500/500',
        postPictureUrl: 'https://picsum.photos/500/250',
        postText: 'Terveppä terve! :D',
        author: "Sanna Marin",
        timestamp: new DateTime.now().subtract(new Duration(minutes: 15)),
      ),
      Post(
        avatarUrl: 'https://picsum.photos/200/200',
        postPictureUrl: 'https://picsum.photos/499/250',
        author: "Paavo Lipponen",
        timestamp: new DateTime.now().subtract(new Duration(minutes: 12)),
      ),
    ];

    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            posts[index],
            index != posts.length - 1 ? SizedBox(height: 10) : Container(),
          ],
        );
      },
    );
  }
}

