import 'package:flutter/services.dart';

class UppercaseTextFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String newText = newValue.text.toUpperCase();

    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}