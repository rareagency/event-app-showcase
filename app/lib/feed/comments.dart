import 'package:flutter/material.dart';

class PostComments extends StatelessWidget {
  final List<Comment> comments;

  PostComments(this.comments);

  @override
  Widget build(BuildContext context) {
    if (comments == null) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: comments.map((comment) => Comment(
        author: comment.author,
        avatarUrl: comment.avatarUrl,
        text: comment.text,
      )).toList(),
    );
  }
}

class Comment extends StatefulWidget {
  final String author;
  final String avatarUrl;
  final String text;

  Comment({
    Key key,
    @required this.author,
    @required this.text,
    this.avatarUrl,
  }) : super(key: key);

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
      children: <TextSpan>[
        TextSpan(text: widget.author + ' ', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: widget.text),
      ],
    )
      )
    );
  }
}
