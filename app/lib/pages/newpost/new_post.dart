import 'dart:io';

import 'package:eventapp/widgets/go_back_appbar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class NewPost extends StatefulWidget {
  final File imageFile;

  NewPost({
    Key key,
    this.imageFile,
  }) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> with TickerProviderStateMixin<NewPost> {
  final GlobalKey<ExtendedImageEditorState> _editorKey = GlobalKey<ExtendedImageEditorState>();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var isImagePost = widget.imageFile != null;

    return Scaffold(
      appBar: GoBackAppbar.getWidget(context),
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            if (isImagePost) Container(
              height: MediaQuery.of(context).size.height / 2,
              child: ExtendedImage.file(
                widget.imageFile,
                fit: BoxFit.contain,
                mode: ExtendedImageMode.editor,
                extendedImageEditorKey: _editorKey,
                initEditorConfigHandler: (state) {
                  return EditorConfig(
                    cornerColor: Theme.of(context).accentColor,
                    maxScale: 8.0,
                    cropRectPadding: EdgeInsets.all(20.0),
                    hitTestSize: 20.0,
                    cropAspectRatio: 1 / 1,
                  );
                },
              ),
            ),

            TextField(
              style: Theme.of(context).textTheme.body1,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onTap: () {
                print('tapped');
              },
            ),

            Container(
              height: MediaQuery.of(context).size.height,
            ),
          ],
        )
      )
    );
  }
}
