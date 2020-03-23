import 'package:eventapp/profile/post_history.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // TODO: Fetch these from API
    String name = 'Teuvo Testaaja';
    String firstName = name.split(' ')[0];
    List<Post> posts = [
      Post(
        text: 'Bussikyyti jatkoille lähtee NYT! Vikatkin messiin ja tanssijalka vipattamaan 😎😎',
      ),
      Post(
        imageUrl: 'https://picsum.photos/500/500',
      ),
      Post(
        imageUrl: 'https://picsum.photos/400/500',
      ),
      Post(
        imageUrl: 'https://picsum.photos/800/500',
      ),
      Post(
        imageUrl: 'https://picsum.photos/540/500',
      )
    ];
    bool isPersonalProfile = true;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  isPersonalProfile ? 'Hei $firstName!' : name,
                  style: Theme.of(context).textTheme.title,
                ),
                Spacer(),
                DropdownMenu(),
              ],
            ),

            SizedBox(height: 28,),

            Center(
              child: GestureDetector(
                onTap: () {
                  print('Changing profile picture'); // TODO
                },
                child: CircleAvatar(
                  radius: 48,
                  backgroundImage: NetworkImage('https://picsum.photos/500/500'),
                  child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.fromLTRB(45, 45, 0, 0),
                    icon: Icon(Icons.camera_alt, color: Theme.of(context).buttonColor),
                  ),
                ),
              )
            ),

            SizedBox(height: 14,),
            Divider(),
            SizedBox(height: 14,),

            PostHistory(
              posts: posts,
              isPersonalProfile: isPersonalProfile,
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        icon: Icon(Icons.more_vert),
        items: <String>['Vaihda nimi', 'Vaihda kuvaus', 'Vaihda profiilikuva'].map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                color: Theme.of(context).textTheme.body2.color,
              )
            ),
          );
        }).toList(),
        onChanged: handleChange,
      ),
    );
  }

  void handleChange(String selected) {
    print('Selected "$selected"');
  }
}
