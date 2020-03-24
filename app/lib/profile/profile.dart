import 'package:eventapp/models.dart';
import 'package:eventapp/profile/post_history.dart';
import 'package:flutter/material.dart';

import '../api.dart';

class Profile extends StatefulWidget {
  final ProfileModel profile;

  Profile(this.profile, { Key key }) : super(key : key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var name = widget.profile.name;
    var firstName = name.split(' ')[0];
    var isPersonalProfile = true;

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
                  isPersonalProfile ? 'Hei $firstName!' : widget.profile.name,
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
              posts: profile.posts,
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
        items: <String>['Vaihda kuvaus', 'Vaihda profiilikuva'].map((String value) {
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
