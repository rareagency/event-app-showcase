import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/event_logo.png'),
                SizedBox(
                  height: 30.0,
                ),
                LoginInput(),
              ],
            ),
          ),
        ));
  }
}

class LoginInput extends StatelessWidget {
  final textStyle = TextStyle(color: Colors.grey[800], fontSize: 20, fontFamily: 'Inter');
  final hintStyle = TextStyle(color: Colors.grey[550], fontSize: 20, fontFamily: 'Inter');
  final cursorColor = Colors.grey[800];
  final iconColor = Colors.grey[800];

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey[200],
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 10.0),
          child: Row(
            children: <Widget>[
              Expanded(child: TextField(
                cursorColor: cursorColor,
                style: textStyle,
                autocorrect: false,
                enableSuggestions: false,
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),

                    icon: Icon(
                      Icons.mail,
                      color: iconColor,
                      size: 38,
                    ),

                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    filled: true,
                    hintText: 'Kutsukoodisi',
                    hintStyle: hintStyle),
              )),

              IconButton(
                icon: Icon(Icons.play_circle_filled),
                color: iconColor,
                iconSize: 30,
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}

