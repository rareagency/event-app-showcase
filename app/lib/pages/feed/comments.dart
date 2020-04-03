import 'package:eventapp/models/feed_comment.dart';
import 'package:eventapp/models/feed_post.dart';
import 'package:eventapp/pages/feed/expanded_comments.dart';
import 'package:flutter/material.dart';

class PostComments extends StatelessWidget {
  final FeedPostModel post;
  final int limit;

  PostComments({ this.post, this.limit = 2 });

  @override
  Widget build(BuildContext context) {
    if (post.comments == null) {
      return Container();
    }

    var isCommentLimitReached = post.comments.length > this.limit;

    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(builder: (context) => ExpandedComments(post))
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: post.comments.getRange(0, this.limit).map((comment) => FeedComment(comment)).toList(),
          ),

          if (isCommentLimitReached) Padding(
            padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 0),
            child: Text(
              'Näytä kaikki ${post.comments.length} kommenttia',
              style: TextStyle(
                color: Theme.of(context).textTheme.body2.color,
              ),
            ),
          ),
        ],
      ),
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
        ),
      ),
    );
  }
}
