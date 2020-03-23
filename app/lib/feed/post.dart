import 'package:eventapp/feed/comments.dart';
import 'package:eventapp/feed/post_actions.dart';
import 'package:eventapp/feed/post_header.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  final String author;
  final DateTime timestamp;
  final String avatarUrl;
  final String postPictureUrl;
  final String postText;
  final List<Comment> comments;

  Post({
    Key key,
    @required this.author,
    @required this.timestamp,
    this.avatarUrl,
    this.postPictureUrl,
    this.postText,
    this.comments,
  }) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        PostHeader(
          timestamp: widget.timestamp,
          avatarUrl: widget.avatarUrl,
          author: widget.author,
        ),

        SizedBox(height: 12,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            this.widget.postPictureUrl != null ? Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, this.widget.postText != null ? 10 : 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9.0),
                child: Image(
                  image: NetworkImage(this.widget.postPictureUrl),
                ),
              ),
            )  : Container(),

            // Post text
            this.widget.postText != null ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                this.widget.postText,
                style: TextStyle(
                  fontSize: 18
                )

              ),
            ) : Container(),

            // Post comments
            PostComments(this.widget.comments),
          ],
        ),
        // Post picture

        PostActions(),
      ],
    );
  }
}
