import 'package:eventapp/models/feed_comment.dart';

class FeedPostModel {
  final String author;
  final DateTime timestamp;
  final String avatarUrl;
  final String pictureUrl;
  final String text;
  final List<FeedCommentModel> comments;

  FeedPostModel({
    this.author,
    this.timestamp,
    this.avatarUrl,
    this.pictureUrl,
    this.text,
    this.comments,
  });
}
