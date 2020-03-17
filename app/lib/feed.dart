import 'package:eventapp/feed_post.dart';
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: <Widget>[
                  FeedPost(
                    avatarUrl: 'https://picsum.photos/500/500',
                    postPictureUrl: 'https://picsum.photos/500/250',
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

