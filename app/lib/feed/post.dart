import 'package:eventapp/feed/comment.dart';
import 'package:eventapp/timeago.dart';
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
        Row(
          children: <Widget>[
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(this.widget.avatarUrl),
            ),
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.widget.author,
                  style: TextStyle(
                    letterSpacing: 0.75,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4,),
                Text(
                  '${Timeago.format(this.widget.timestamp)}',
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                  ),
                )
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
              color: Theme.of(context).hintColor,
            )
          ],
        ),

        SizedBox(height: 12,),

        // Post picture
        this.widget.postPictureUrl != null ? Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, this.widget.postText != null ? 10 : 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image(
              image: NetworkImage(this.widget.postPictureUrl),
            ),
          ),
        )  : Container(),

        // Post text
        this.widget.postText != null ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(this.widget.postText),
        ) : Container(),

        // Post comments
        this.widget.comments != null ? PostComments(this.widget.comments) : Container(),

        ActionButtons(),
      ],
    );
  }
}

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
              Icons.thumb_up,
              color: Theme.of(context).hintColor
          ),
          onPressed: () {
            print('Thumbs up');
          },
        ),
        SizedBox(width: 12,),
        IconButton(
          icon: Icon(Icons.mode_comment, color: Theme.of(context).hintColor),
          onPressed: () {
            print('Comments');
          },
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.share, color: Theme.of(context).hintColor),
          onPressed: () {
            print('Share');
          },
        )
      ],
    );
  }
}

class PostComments extends StatelessWidget {
  final List<Comment> comments;

  PostComments(this.comments);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: comments.map((comment) => Comment(
        author: comment.author,
        avatarUrl: comment.avatarUrl,
        text: comment.text,
      )).toList(),
    );
  }
}
