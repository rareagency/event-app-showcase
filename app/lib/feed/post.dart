import 'package:eventapp/feed/comments.dart';
import 'package:eventapp/feed/post_header.dart';
import 'package:eventapp/models.dart';
import 'package:flutter/material.dart';

class FeedPost extends StatefulWidget {
  final FeedPostModel feedPost;

  FeedPost(this.feedPost, { Key key }) : super(key: key);

  @override
  _FeedPostState createState() => _FeedPostState();
}

class _FeedPostState extends State<FeedPost> {
  @override
  Widget build(BuildContext context) {
    var feedPost = this.widget.feedPost;
    var hasPicture = feedPost.pictureUrl != null;
    var isTextOnlyPost = feedPost.text != null && feedPost.pictureUrl == null;
    var isPictureOnlyPost = feedPost.text == null && feedPost.pictureUrl != null;
    var isPictureWithTextPost = feedPost.text != null && feedPost.pictureUrl != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        PostHeader(
          timestamp: feedPost.timestamp,
          avatarUrl: feedPost.avatarUrl,
          author: feedPost.author,
        ),

        SizedBox(height: 12,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            hasPicture ? Container(
              margin: EdgeInsets.fromLTRB(
                0, 0, 0,
                !isPictureOnlyPost ? 14 : 0
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9.0),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(feedPost.pictureUrl),
                  ),
                ),
              ),
            )  : Container(),

            isPictureWithTextPost ? FeedComment(
              FeedCommentModel(
                author: feedPost.author,
                text: feedPost.text,
              )
            ) : Container(),

            isTextOnlyPost ? Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10.0),
              child: Text(
                feedPost.text,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5
                )
              ),
            ) : Container(),

            PostComments(
              comments: feedPost.comments,
              limit: 2
            ),
          ],
        ),
        // Post picture
      ],
    );
  }
}
