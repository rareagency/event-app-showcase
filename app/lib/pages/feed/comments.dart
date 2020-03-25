import 'package:eventapp/models/feed_comment.dart';
import 'package:flutter/material.dart';

class PostComments extends StatelessWidget {
  final List<FeedCommentModel> comments;
  final int limit;

  PostComments({ this.comments, this.limit = 2 });

  @override
  Widget build(BuildContext context) {
    if (comments == null) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: comments.getRange(0, this.limit).map((comment) => FeedComment(comment)).toList(),
        ),
        this.comments.length > this.limit ? Padding(
          padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 0),
          child: Text(
              'Näytä kaikki ${this.comments.length} kommenttia',
              style: TextStyle(
                color: Theme.of(context).textTheme.body2.color,
              ),
          ),
        ) : Container(),
      ],
    );
  }
}

class FeedComment extends StatelessWidget {
  final FeedCommentModel comment;

  FeedComment(this.comment, { Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(text: comment.author + ' ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: comment.text),
          ],
        )
      )
    );
  }
}
