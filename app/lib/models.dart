class TimelineItemModel {
  final DateTime startTime;
  final DateTime endTime;
  final String pictureUrl;
  final String title;
  final String text;

  TimelineItemModel({
    this.startTime,
    this.endTime,
    this.pictureUrl,
    this.title,
    this.text,
  });
}

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

class FeedCommentModel {
  final String author;
  final String avatarUrl;
  final String text;

  FeedCommentModel({
    this.author,
    this.text,
    this.avatarUrl,
  });
}

class ProfileModel {
  final String name;
  final List<ProfilePostModel> posts;

  ProfileModel({
    this.name,
    this.posts,
  });
}

class ProfilePostModel {
  final String imageUrl;
  final String text;

  ProfilePostModel({
    this.imageUrl,
    this.text
  });
}
