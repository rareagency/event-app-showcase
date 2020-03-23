import 'package:flutter/material.dart';

class PostComments extends StatelessWidget {
  final List<Comment> comments;
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
          children: comments.getRange(0, this.limit).map((comment) => Comment(
            author: comment.author,
            avatarUrl: comment.avatarUrl,
            text: comment.text,
          )).toList(),
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

class Comment extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(text: author + ' ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: text),
          ],
        )
      )
    );
  }
}
