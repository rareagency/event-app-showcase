import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';

class Disconnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              AntIcons.disconnect,
              size: 64,
            ),
            SizedBox(height: 14,),
            Text(
              'Yhteys katkennut',
              style: Theme.of(context).textTheme.body2.copyWith(
                  fontSize: 18
              ),
            ),
            SizedBox(height: 6,),
            Text(
              'Odotetaan yhteyttä...',
              style: Theme.of(context).textTheme.body2.copyWith(
                  fontSize: 14
              ),
            ),
            SizedBox(height: 24,),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).accentColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}
