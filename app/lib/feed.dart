import 'package:eventapp/feed_comment.dart';
import 'package:eventapp/feed_post.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: <Widget>[
                  FeedPost(
                    avatarUrl: 'https://picsum.photos/500/500',
                    postText: 'Terveppä terve! :D',
                    author: "Sanna Marin",
                    timestamp: new DateTime.now().subtract(new Duration(minutes: 15)),
                    comments: [
                      FeedComment(
                        author: 'Matti Meikäläinen',
                        avatarUrl: 'https://picsum.photos/233/233',
                        text: 'Tässä on tosi pitkä teksti joka valuu yli Tässä on tosi pitkä teksti joka valuu yli Tässä on tosi pitkä teksti joka valuu yli'
                      ),
                      FeedComment(
                          author: 'Teppo Teikäläinen',
                          avatarUrl: 'https://picsum.photos/235/233',
                          text: 'Nauraa'
                      ),
                      FeedComment(
                          author: 'Soivio',
                          avatarUrl: 'https://picsum.photos/232/233',
                          text: ':D'
                      ),
                    ]
                  ),
                  FeedPost(
                    avatarUrl: 'https://picsum.photos/500/500',
                    postPictureUrl: 'https://picsum.photos/500/250',
                    postText: 'Terveppä terve! :D',
                    author: "Sanna Marin",
                    timestamp: new DateTime.now().subtract(new Duration(minutes: 15)),
                  ),
                  FeedPost(
                    avatarUrl: 'https://picsum.photos/200/200',
                    postPictureUrl: 'https://picsum.photos/499/250',
                    author: "Paavo Lipponen",
                    timestamp: new DateTime.now().subtract(new Duration(minutes: 12)),
                  ),
                ],
              ),
            ),
    );
  }
}

