import 'package:eventapp/timeago.dart';
import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  final DateTime timestamp;
  final String author;
  final String avatarUrl;

  PostHeader({
    Key key,
    @required this.timestamp,
    this.avatarUrl,
    this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(avatarUrl),
        ),
        SizedBox(width: 10,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              author,
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 0.45,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4,),
            Text(
              '${Timeago.format(timestamp)}',
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).textTheme.body2.color,
              ),
            )
          ],
        ),
      ],
    );
  }
}
