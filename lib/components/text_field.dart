import 'package:flutter/material.dart';
import 'package:todolistapp/constants.dart';

class TextFieldType extends StatelessWidget {
  const TextFieldType({
    super.key,
    required this.textHint,
    required this.fontSize,
  });
  final String textHint;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration.collapsed(
        hintText: textHint,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
        border: InputBorder.none,
      ),
      style: kTextDescriptionSimpleCard.copyWith(fontSize: fontSize),
      textAlign: TextAlign.left,
    );
  }
}
