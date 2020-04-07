// Only fake data for now
import 'package:eventapp/models/feed_comment.dart';
import 'package:eventapp/models/feed_post.dart';
import 'package:eventapp/models/profile.dart';
import 'package:eventapp/models/profile_post.dart';

List<FeedCommentModel> feedComments = [
  FeedCommentModel(
    author: 'Seppo taalasmaa',
    avatarUrl: 'https://picsum.photos/233/233',
    text: 'Tosi pitkä testi joka wrappaa. Tosi pitkä testi joka wrappaa. Tosi pitkä testi joka wrappaa. Tosi pitkä testi joka wrappaa. Tosi pitkä testi joka wrappaa.'
  ),
  FeedCommentModel(
    author: 'Kalle Hirvola',
    avatarUrl: 'https://picsum.photos/500/500',
    text: 'Emoji kommentti 😎'
  ),
  FeedCommentModel(
    author: 'Kalle Hirvola',
    avatarUrl: 'https://picsum.photos/500/500',
    text: 'Emoji kommentti 2 😎'
  ),
  FeedCommentModel(
    author: 'Kalle Hirvola',
    avatarUrl: 'https://picsum.photos/500/500',
    text: 'Emoji kommentti 3 😎'
  ),
];

List<FeedPostModel> feedPosts = [
  FeedPostModel(
    avatarUrl: 'https://picsum.photos/500/500',
    pictureUrl: 'https://picsum.photos/500/250',
    author: "Pyry Rouvila",
    timestamp: new DateTime.now().subtract(new Duration(minutes: 15)),
    comments: feedComments
  ),
  FeedPostModel(
    pictureUrl: 'https://picsum.photos/333/250',
    avatarUrl: 'https://picsum.photos/500/500',
    text: 'Bussikyyti jatkoille lähtee NYT! Vikatkin messiin ja tanssijalka vipattamaan 😎😎',
    author: "Sanna Marin",
    timestamp: new DateTime.now().subtract(new Duration(minutes: 15)),
  ),
  FeedPostModel(
    avatarUrl: 'https://picsum.photos/200/200',
    pictureUrl: 'https://picsum.photos/499/250',
    author: "Paavo Lipponen",
    timestamp: new DateTime.now().subtract(new Duration(minutes: 12)),
    comments: feedComments,
  ),
];

List<ProfilePostModel> profilePosts = [
  ProfilePostModel(
    text: 'Bussikyyti jatkoille lähtee NYT! Vikatkin messiin ja tanssijalka vipattamaan 😎😎',
  ),
  ProfilePostModel(
    imageUrl: 'https://picsum.photos/500/500',
  ),
  ProfilePostModel(
    imageUrl: 'https://picsum.photos/400/500',
  ),
  ProfilePostModel(
    imageUrl: 'https://picsum.photos/800/500',
  ),
  ProfilePostModel(
    imageUrl: 'https://picsum.photos/540/500',
  )
];

ProfileModel profile = ProfileModel(
  name: 'Teuvo Testaaja',
  bio: 'Tiedän fronttidevaamisesta ja designaus on kivaa!',
  avatarUrl: 'https://picsum.photos/485/485',
  posts: [
    ProfilePostModel(
      text: 'Bussikyyti jatkoille lähtee NYT! Vikatkin messiin ja tanssijalka vipattamaan 😎😎',
    ),
    ProfilePostModel(
      imageUrl: 'https://picsum.photos/500/500',
    ),
    ProfilePostModel(
      imageUrl: 'https://picsum.photos/400/500',
    ),
    ProfilePostModel(
      imageUrl: 'https://picsum.photos/800/500',
    ),
    ProfilePostModel(
      imageUrl: 'https://picsum.photos/540/500',
    )
  ],
);