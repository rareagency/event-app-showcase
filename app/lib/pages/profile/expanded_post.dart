import 'package:eventapp/api.dart';
import 'package:eventapp/models/feed_post.dart';
import 'package:eventapp/models/profile_post.dart';
import 'package:eventapp/pages/feed/post.dart';
import 'package:eventapp/widgets/go_back_appbar.dart';
import 'package:flutter/material.dart';

import '../../app.dart';

class ExpandedPost extends StatelessWidget {
  final ProfilePostModel profilePost;
  final FeedPostModel feedPost = feedPosts[0]; // TODO: This needs to be fetched from API

  ExpandedPost(this.profilePost);

  @override
  Widget build(BuildContext context) {
    var app = context.findAncestorStateOfType<AppState>();
    app.hideNavBar();

    return Scaffold(
      appBar: GoBackAppbar.getWidget(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: FeedPost(feedPost),
      ),
    );
  }
}
