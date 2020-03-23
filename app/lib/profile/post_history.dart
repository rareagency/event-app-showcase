import 'package:flutter/material.dart';

class PostHistory extends StatefulWidget {
  final List<Post> posts;
  final bool isPersonalProfile;

  PostHistory({ this.posts, this.isPersonalProfile });

  @override
  _PostHistoryState createState() => _PostHistoryState();
}

class _PostHistoryState extends State<PostHistory> {
  @override
  Widget build(BuildContext context) {
    bool hasPosts = widget.posts != null && widget.posts.length > 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        hasPosts ? Text('${widget.posts.length} julkaisua',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.title,
        ) : Container(),

        SizedBox(height: 28,),

        widget.posts == null || widget.posts.length == 0 ? Center(
          child: Text(
            widget.isPersonalProfile ? 'Et ole vielä julkaissut' : 'Ei julkaisuja',
            style: TextStyle(
              color: Theme.of(context).textTheme.body2.color
            )
          ),
        ) : PostGrid(widget.posts),
      ],
    );
  }
}

class PostGrid extends StatelessWidget {
  final List<Post> posts;

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
            print('Clicked on ${post.imageUrl}');
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

class Post {
  final String imageUrl;
  final String text;

  Post({ this.imageUrl, this.text });
}
