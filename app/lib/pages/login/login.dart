import 'dart:ui';

import 'package:ant_icons/ant_icons.dart';
import 'package:eventapp/pages/login/uppercase_text_formatter.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _currentText = '';
  var _textFieldSelected = false;

  @override
  Widget build(BuildContext context) {
    var touched = _textFieldSelected || _currentText.isNotEmpty;

    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login_background.png'),
          fit: BoxFit.fitHeight,
          alignment: Alignment.topLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            setState(() {
              _textFieldSelected = false;
            });
          },
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RotatedBox(
                      quarterTurns: 5,
                      child: Image.asset(
                        'assets/rare_logo.png',
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: -(MediaQuery.of(context).size.width * 1.1),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 1.75,
                    width: MediaQuery.of(context).size.width * 1.75,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xff570663).withAlpha(50),
                          const Color(0xffF23765).withAlpha(230),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 0.5],
                      ),
                      shape: BoxShape.circle,
                    ),
                  )
                ),

                Positioned(
                  top: 0,
                  child: Container(
                    color: Colors.white.withAlpha(20),
                    height: MediaQuery.of(context).size.width / 3,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),

                Positioned(
                  bottom: 75.0,
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'INVITATION CODE',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            letterSpacing: 1,
                            color: Colors.white,
                          )
                        ),

                        SizedBox(height: 16),

                        TextField(
                          cursorColor: Colors.grey[500],
                          maxLength: 12,
                          maxLengthEnforced: true,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            UppercaseTextFormatter(),
                          ],
                          autocorrect: false,
                          enableSuggestions: false,
                          style: TextStyle(
                            fontFamily: 'Roboto Mono',
                            color: Colors.grey[400],
                            fontSize: 18,
                          ),

                          decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            contentPadding: touched
                              ? const EdgeInsets.fromLTRB(20.0, 0, 0.0, 0)
                              : const EdgeInsets.fromLTRB(0.0, 0, 0.0, 0),
                            hintText: _textFieldSelected ? '': '',
                            hintStyle: TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.grey[400],
                              fontSize: 16,
                            ),
                            suffixIcon:
                            touched
                              ? GestureDetector(
                                onTap: () => this.handleSubmit(_currentText),
                                child: Icon(
                                  AntIcons.login,
                                  size: 30,
                                  color: Colors.grey[400],
                                ),
                              ) : null,
                            fillColor: Colors.black.withAlpha(150),
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(7.0),
                              ),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _currentText = value;
                            });
                          },
                          onTap: () {
                            setState(() {
                              _textFieldSelected = true;
                            });
                          },
                          onSubmitted: handleSubmit
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleSubmit(String value) {
    print('Submitted: $value');
  }
}