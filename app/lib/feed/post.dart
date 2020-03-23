import 'package:eventapp/feed/comments.dart';
import 'package:eventapp/feed/post_header.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  final String author;
  final DateTime timestamp;
  final String avatarUrl;
  final String pictureUrl;
  final String text;
  final List<Comment> comments;

  Post({
    Key key,
    @required this.author,
    @required this.timestamp,
    this.avatarUrl,
    this.pictureUrl,
    this.text,
    this.comments,
  }) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    var textOnlyPost = this.widget.text != null && this.widget.pictureUrl == null;
    var pictureOnlyPost = this.widget.text == null && this.widget.pictureUrl != null;
    var pictureWithTextPost = this.widget.text != null && this.widget.pictureUrl != null;

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
            this.widget.pictureUrl != null ? Container(
              margin: EdgeInsets.fromLTRB(
                  0, 0, 0,
                  !pictureOnlyPost ? 14 : 0
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9.0),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(this.widget.pictureUrl),
                  ),
                ),
              ),
            )  : Container(),

            pictureWithTextPost ? Comment(
              author: widget.author,
              text: widget.text,
            ) : Container(),

            textOnlyPost ? Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10.0),
              child: Text(
                this.widget.text,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5
                )
              ),
            ) : Container(),

            PostComments(
              comments: this.widget.comments,
              limit: 2
            ),
          ],
        ),
        // Post picture
      ],
    );
  }
}
