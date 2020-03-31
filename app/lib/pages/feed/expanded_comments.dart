import 'package:eventapp/app.dart';
import 'package:eventapp/models/feed_comment.dart';
import 'package:eventapp/models/feed_post.dart';
import 'package:eventapp/widgets/go_back_appbar.dart';
import 'package:flutter/material.dart';

class ExpandedComments extends StatefulWidget {
  final FeedPostModel post;

  ExpandedComments(this.post, { Key key }) : super(key : key);

  @override
  _ExpandedCommentsState createState() => _ExpandedCommentsState();
}

class _ExpandedCommentsState extends State<ExpandedComments> {
  String _currentText = '';

  @override
  Widget build(BuildContext context) {
    var postHasText = widget.post.text != null && widget.post.text.isNotEmpty;
    var app = context.findAncestorStateOfType<AppState>();

    app.hide.reverse();

    return Scaffold(
      appBar:  GoBackAppbar.getWidget(context),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            if (postHasText) Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                  child: CommentWithAvatar(
                    FeedCommentModel(
                      author: widget.post.author,
                      avatarUrl: widget.post.avatarUrl,
                      text: widget.post.text,
                    )
                  ),
                ),
                Divider(
                  height: 1,
                ),
              ]
            ),

            Expanded(
              child: ListView.builder(
                itemCount: widget.post.comments.length,
                itemBuilder: (context, index) {
                  var comment = widget.post.comments[index];
                  return CommentWithAvatar(comment);
                },
              ),
            ),

            Divider(
              height: 2,
              thickness: 2,
            ),

            TextField(
              onChanged: (value) {
                setState(() {
                  _currentText = value;
                });
              },
              style: Theme.of(context).textTheme.body1,
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(14, 16, 0, 0),
                suffixIcon: IconButton(
                  onPressed: () {
                    print('Send comment');
                  },
                  icon: Icon(
                    Icons.send,
                    color: _currentText.isEmpty
                        ? Theme.of(context).hintColor
                        : Theme.of(context).accentColor,
                  ),
                ),
                border: InputBorder.none,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                filled: true,
                hintText: 'Kirjoita kommentti...',
                hintStyle: Theme.of(context).textTheme.body1.copyWith(
                    color: Theme.of(context).hintColor
                )),
              ),
          ],
        ),
      ),
    );
  }
}

class CommentWithAvatar extends StatelessWidget {
  final FeedCommentModel comment;

  CommentWithAvatar(this.comment, { Key key }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(comment.avatarUrl),
          ),
          SizedBox(width: 16,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: comment.author + ' ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: comment.text),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
