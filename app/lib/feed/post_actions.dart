import 'package:flutter/material.dart';

class PostActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
