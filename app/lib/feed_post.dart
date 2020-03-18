import 'package:eventapp/feed_comment.dart';
import 'package:eventapp/timeago.dart';
import 'package:flutter/material.dart';

class FeedPost extends StatefulWidget {
  final String author;
  final DateTime timestamp;
  final String avatarUrl;
  final String postPictureUrl;
  final String postText;
  final List<FeedComment> comments;

  FeedPost({
    @required this.author,
    @required this.timestamp,
    this.avatarUrl,
    this.postPictureUrl,
    this.postText,
    this.comments,
  });

  @override
  _FeedPostState createState() => _FeedPostState();
}

class _FeedPostState extends State<FeedPost> {
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
        getPictureWidget(),
        getTextWidget(),
        this.widget.comments != null ? FeedPostComments(comments: this.widget.comments) : Container(),

        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Row(
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
          ),
        ),
      ],
    );
  }

  Widget getPictureWidget() {
    if (this.widget.postPictureUrl != null) {
      return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, this.widget.postText != null ? 10 : 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image(
            image: NetworkImage(this.widget.postPictureUrl),
          ),
        ),
      );
    }

    return Container();
  }

  Widget getTextWidget() {
    if (this.widget.postText != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(this.widget.postText),
      );
    }

    return Container();
  }
}

class FeedPostComments extends StatelessWidget {
  final List<FeedComment> comments;

  FeedPostComments({ this.comments  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 0, 10),
      child: Column(
        children: this.comments.map((comment) => FeedComment(
          author: comment.author,
          avatarUrl: comment.avatarUrl,
          text: comment.text,
        )).toList(),
      )
    );
  }
}
