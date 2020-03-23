import 'package:flutter/material.dart';

class Comment extends StatefulWidget {
  final String author;
  final String avatarUrl;
  final String text;

  Comment({ Key key, @required this.author, this.avatarUrl, @required this.text  }) : super(key: key);

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  bool expanded = false;

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
                      this.expanded = !this.expanded;
                    });
                  },
                  child: Text(
                    this.widget.text,
                    overflow: this.expanded ? TextOverflow.visible : TextOverflow.fade,
                    maxLines: this.expanded ? null : 2,
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