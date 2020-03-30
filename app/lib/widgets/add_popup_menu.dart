import 'dart:io';

import 'package:ant_icons/ant_icons.dart';
import 'package:eventapp/pages/newpost/new_post.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:popup_menu/popup_menu.dart';

class AddPopupMenu {
  PopupMenu popupMenu;
  BuildContext context;

  AddPopupMenu(BuildContext context) {
    PopupMenu.context = context;
    this.context = context;

    TextStyle textStyle = Theme.of(context).textTheme.body1.copyWith(
      fontSize: 12,
    );
    Color iconColor = Theme.of(context).textTheme.body1.color;

    popupMenu = PopupMenu(
      backgroundColor: Theme.of(context).popupMenuTheme.color,
      lineColor: Theme.of(context).textTheme.body1.color.withAlpha(100),
      highlightColor: Theme.of(context).highlightColor,
      maxColumn: 3,
      items: [
        MenuItem(
          title: 'Galleria',
          textStyle: textStyle,
          image: Icon(
            AntIcons.picture,
            color: iconColor,
          )
        ),
        MenuItem(
          title: 'Kamera',
          textStyle: textStyle,
          image: Icon(
            AntIcons.camera,
            color: iconColor,
          )
        ),
        MenuItem(
          title: 'Teksti',
          textStyle: textStyle,
          image: Icon(
            AntIcons.file_text,
            color: iconColor,
          )
        ),
      ],
      onClickMenu: (item) {
        if (item.menuTitle == 'Galleria') {
          getImage(ImageSource.gallery);
        }

        if (item.menuTitle == 'Kamera') {
          getImage(ImageSource.camera);
        }

        if (item.menuTitle == 'Teksti') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NewPost())
          );
        }
      });
  }

  Future getImage(ImageSource source) async {
    File image;

    if (source == ImageSource.camera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    if (image != null) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => NewPost(
          imageFile: image,
        ))
      );
    }
  }

  void showAt(GlobalKey globalKey) {
    popupMenu.show(widgetKey: globalKey);
  }
}
