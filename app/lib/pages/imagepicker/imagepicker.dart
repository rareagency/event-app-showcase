import 'package:eventapp/router.dart';
import 'package:flutter/material.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({ Key key, this.destination }) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Image picker placeholder')),
    );
  }
}
