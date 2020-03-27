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
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.transparent],
              ).createShader(Rect.fromLTRB(0, rect.height/1.1, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Text('Here will be feed map'),
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.fromLTRB(22.0, 8.0, 22.0, 12.0),
            itemCount: feedPosts.length,
            itemBuilder: (context, index) {
              var feedPost = feedPosts[index];
              var isLastPost = index == feedPosts.length - 1;

              return Column(
                children: <Widget>[
                  FeedPost(feedPost),
                  SizedBox(height: isLastPost ? 0 : 12),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

