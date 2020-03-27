// Only fake data for now
import 'package:eventapp/models/feed_comment.dart';
import 'package:eventapp/models/feed_post.dart';
import 'package:eventapp/models/profile.dart';
import 'package:eventapp/models/profile_post.dart';
import 'package:eventapp/models/schedule_event.dart';

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

List<ScheduleEvent> scheduleItems = [
  ScheduleEvent(
    startTime: DateTime.now().add(Duration(minutes: 15)),
    endTime: DateTime.now().add(Duration(minutes: 30)),
    title: 'Random event #1',
    text: 'Event with end time and picture. Also very long text that wraps.',
    pictureUrl: 'https://picsum.photos/500/200',
    location: 'Sitko, Näsilinnankatu 22'
  ),
  ScheduleEvent(
    startTime: DateTime.now().add(Duration(days: 15)),
    title: 'Random event #2',
    text: 'Some event',
    location: 'Rare, Polttimonkatu 4'
  ),
  ScheduleEvent(
    startTime: DateTime.now().add(Duration(minutes: 15)),
    title: 'Random event with very long name that wraps #1',
    text: 'Some text',
  )
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