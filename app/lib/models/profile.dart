import 'package:eventapp/models/profile_post.dart';

class ProfileModel {
  final String name;
  final String avatarUrl;
  final List<ProfilePostModel> posts;

  ProfileModel({
    this.name,
    this.avatarUrl,
    this.posts,
  });
}
