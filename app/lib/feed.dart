import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: <Widget>[
                  FeedPost(
                    avatarUrl: 'https://picsum.photos/500/500',
                    postPictureUrl: 'https://picsum.photos/500/250',
                    author: "Sanna Marin",
                    timestamp: new DateTime.now().subtract(new Duration(minutes: 15)),
                  ),
                  FeedPost(
                    avatarUrl: 'https://picsum.photos/200/200',
                    postPictureUrl: 'https://picsum.photos/499/250',
                    author: "Paavo Lipponen",
                    timestamp: new DateTime.now().subtract(new Duration(minutes: 12)),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          selectedItemColor: Colors.blue[800],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Feed'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt),
              title: Text('Add content'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              title: Text('Messages'),
            ),
          ],
      )
    );
  }
}


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
                    letterSpacing: 1.5,
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
              Icon(
                  Icons.thumb_up,
                  color: Theme.of(context).hintColor
              ),
              SizedBox(width: 12,),
              Icon(Icons.mode_comment, color: Theme.of(context).hintColor),
              Spacer(),
              Icon(Icons.share, color: Theme.of(context).hintColor)
            ],
          ),
        ),
        SizedBox(height: 8,)
      ],
    );
  }
}
