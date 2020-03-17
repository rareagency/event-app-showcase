import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class FeedPost extends StatelessWidget {
  final String author;
  final DateTime timestamp;
  final String avatarUrl;
  final String postPictureUrl;

  FeedPost({
    Key key,
    @required this.author,
    @required this.timestamp,
    this.avatarUrl,
    this.postPictureUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(this.avatarUrl),
            ),
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.author,
                  style: TextStyle(
                    letterSpacing: 0.75,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4,),
                Text(
                  '${timeago.format(this.timestamp)}',
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
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image(
            image: NetworkImage(this.postPictureUrl),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
}
