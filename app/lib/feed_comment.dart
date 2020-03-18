import 'package:flutter/material.dart';

class FeedComment extends StatefulWidget {
  final String author;
  final String avatarUrl;
  final String text;

  FeedComment({ this.author, this.avatarUrl, this.text  });

  @override
  _FeedCommentState createState() => _FeedCommentState();
}

class _FeedCommentState extends State<FeedComment> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(this.widget.avatarUrl),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      this.widget.author,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        letterSpacing: 0.75,
                      )
                  ),
                  SizedBox(height: 2,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        this._expanded = !this._expanded;
                      });
                    },
                    child: Text(
                      this.widget.text,
                      overflow: this._expanded ? TextOverflow.visible : TextOverflow.fade,
                      maxLines: this._expanded ? null : 2,
                    ),
                  ),
                ],
              ),
            ),
          ]
      ),
    );
  }
}