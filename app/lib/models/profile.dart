import 'package:eventapp/models/profile_post.dart';

class ProfileModel {
  final String name;
  final List<ProfilePostModel> posts;

  ProfileModel({
    this.name,
    this.posts,
  });
}
