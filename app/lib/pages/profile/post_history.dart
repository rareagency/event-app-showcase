import 'package:eventapp/models/profile_post.dart';
import 'package:flutter/material.dart';

class PostHistory extends StatefulWidget {
  final List<ProfilePostModel> posts;
  final bool isPersonalProfile;

  PostHistory({ this.posts, this.isPersonalProfile });

  @override
  _PostHistoryState createState() => _PostHistoryState();
}

class _PostHistoryState extends State<PostHistory> {
  @override
  Widget build(BuildContext context) {
    var hasPosts = widget.posts != null && widget.posts.length > 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (hasPosts) Text(
          '${widget.posts.length} julkaisua',
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.title,
        ),

        SizedBox(height: 28,),

        hasPosts ? PostGrid(widget.posts) : Center(
          child: Text(
            widget.isPersonalProfile ? 'Et ole vielä julkaissut' : 'Ei julkaisuja',
            style: Theme.of(context).textTheme.body2,
          ),
        ),
      ],
    );
  }
}

class PostGrid extends StatelessWidget {
  final List<ProfilePostModel> posts;

  PostGrid(this.posts);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      children: posts.map((post) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/profile-post',
              arguments: post
            );

            print('Clicked on ${post.toString()}');
          },
          child: post.imageUrl != null ? ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(post.imageUrl,
            fit: BoxFit.cover),
          ) : Center(
            child: Text(
              post.text,
              overflow: TextOverflow.fade,
              maxLines: 50,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              )
            ),
          )
        );
      }).toList(),
    );
  }
}

