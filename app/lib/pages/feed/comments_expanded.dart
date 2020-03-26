import 'package:eventapp/models/feed_comment.dart';
import 'package:eventapp/models/feed_post.dart';
import 'package:flutter/material.dart';

class CommentsExpanded extends StatefulWidget {
  final FeedPostModel post;

  CommentsExpanded(this.post, { Key key }) : super(key : key);

  @override
  _CommentsExpandedState createState() => _CommentsExpandedState();
}

class _CommentsExpandedState extends State<CommentsExpanded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CommentWithAvatar(
              FeedCommentModel(
                author: widget.post.author,
                avatarUrl: widget.post.avatarUrl,
                text: widget.post.text,
              )
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: widget.post.comments.length,
                itemBuilder: (context, index) {
                  var comment = widget.post.comments[index];
                  return CommentWithAvatar(comment);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentWithAvatar extends StatelessWidget {
  final FeedCommentModel comment;

  CommentWithAvatar(this.comment, { Key key }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(comment.avatarUrl),
          ),
          SizedBox(width: 16,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
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
            ),
          ),
        ],
      ),
    );
  }
}
