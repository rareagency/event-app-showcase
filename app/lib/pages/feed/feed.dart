import 'package:eventapp/api.dart';
import 'package:eventapp/pages/feed/post.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        padding: EdgeInsets.all(22.0),
        itemCount: feedPosts.length,
        itemBuilder: (context, index) {
          var feedPost = feedPosts[index];

          return Column(
            children: <Widget>[
              FeedPost(feedPost),
              index != feedPosts.length - 1 ? SizedBox(height: 28) : Container(),
            ],
          );
        },
      ),
    );
  }
}

