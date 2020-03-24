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
    var hasPicture = this.widget.pictureUrl != null;
    var isTextOnlyPost = this.widget.text != null && this.widget.pictureUrl == null;
    var isPictureOnlyPost = this.widget.text == null && this.widget.pictureUrl != null;
    var isPictureWithTextPost = this.widget.text != null && this.widget.pictureUrl != null;

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
            hasPicture ? Container(
              margin: EdgeInsets.fromLTRB(
                  0, 0, 0,
                  !isPictureOnlyPost ? 14 : 0
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

            isPictureWithTextPost ? Comment(
              author: widget.author,
              text: widget.text,
            ) : Container(),

            isTextOnlyPost ? Padding(
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
