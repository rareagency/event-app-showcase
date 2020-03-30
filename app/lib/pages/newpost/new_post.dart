import 'dart:io';

import 'package:eventapp/widgets/go_back_appbar.dart';
import 'package:flutter/material.dart';

class NewPost extends StatelessWidget {
  final File image;

  NewPost({
    Key key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isImagePost = image != null;
    
    return Scaffold(
      appBar: GoBackAppbar.getWidget(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            isImagePost ? ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.file(this.image)
              ),
            ) : Container(),
          ],
        ),
      )
    );
  }
}
