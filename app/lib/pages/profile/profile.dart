import 'package:ant_icons/ant_icons.dart';
import 'package:eventapp/api.dart';
import 'package:eventapp/pages/profile/post_history.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var name = profile.name;
    var firstName = name.split(' ')[0];
    var isPersonalProfile = true;
    var hasBio = profile.bio != null && profile.bio.isNotEmpty;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  isPersonalProfile ? 'Hei $firstName!' : profile.name,
                  style: Theme.of(context).textTheme.title,
                ),
                Spacer(),
                DropdownMenu(),
              ],
            ),
            SizedBox(
              height: 28,
            ),
            Center(
              child: GestureDetector(
              onTap: () {
                print('Changing profile picture'); // TODO
              },
              child: CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage(profile.avatarUrl),
                child: IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.fromLTRB(45, 45, 0, 0),
                  icon: Icon(AntIcons.camera,
                      color: Theme.of(context).buttonColor),
                ),
              ),
            )),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: hasBio
                    ? Text(
                        profile.bio,
                        style: Theme.of(context).textTheme.body1,
                      )
                    : Text(
                        'Ei bioa',
                        style: Theme.of(context).textTheme.body2.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
            ),
            SizedBox(
              height: 24,
            ),
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
        icon: Icon(
          Icons.more_vert,
          color: Theme.of(context).textTheme.body1.color,
        ),
        items: <String>[
          'Muokkaa profiilikuvaa',
          'Muokkaa bioa',
          'Muokkaa nimeä'
        ].map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Theme.of(context).textTheme.body1.copyWith(
                fontWeight: FontWeight.bold,
              ),
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
