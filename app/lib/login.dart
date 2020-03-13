import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.backgroundColor,
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
  final fontSize = 20.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
        color: theme.cardColor,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 10.0),
          child: Row(
            children: <Widget>[
              Expanded(child: TextField(
                cursorColor: theme.cursorColor,
                style: TextStyle(color: theme.hintColor, fontSize: fontSize),
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
                      color: theme.primaryColor,
                      size: 38,
                    ),

                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    filled: true,
                    hintText: 'Kutsukoodisi',
                    hintStyle: TextStyle(color: theme.hintColor, fontSize: fontSize)),
              )),

              IconButton(
                icon: Icon(Icons.play_circle_filled),
                color: theme.primaryColor,
                iconSize: 30,
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}

