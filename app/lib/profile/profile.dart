import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Oma profiili',
                style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor
                )),
                Spacer(),
                DropdownMenu(),
              ],
            ),
            SizedBox(height: 24,),
            Center(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 48,
                      backgroundImage: NetworkImage('https://picsum.photos/500/500'),
                      child: IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: () {
                          print('Profile avatar click');
                        },
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text(
                        'Appi Mestari',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    SizedBox(height: 12,),
                    Text('Super appi devaaja jäbä',
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontSize: 15,
                    )),
                    SizedBox(height: 16),
                    Divider(),
                    SizedBox(height: 12,),
                    ProfileGallery(),
                  ],
                ))
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
            child: new Text(value),
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

class ProfileGallery extends StatelessWidget {
  final List<String> images = [
    'https://picsum.photos/500/500',
    'https://picsum.photos/499/499',
    'https://picsum.photos/498/498',
    'https://picsum.photos/497/497',
    'https://picsum.photos/497/497',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      children: images.map((imgUrl) {
        return GestureDetector(
          onTap: () {
            print('Clicked on $imgUrl');
          },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(imgUrl),
            )
        );
      }).toList(),
    );
  }
}
