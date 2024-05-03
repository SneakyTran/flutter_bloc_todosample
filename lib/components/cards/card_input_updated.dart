import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/constants.dart';
import 'package:todolistapp/models/tasks/providers/input_provider/add_project_input_provider.dart';

class CardInput extends StatefulWidget {
  const CardInput({
    super.key,
    required this.title,
    this.hintText,
    this.maxLinesTextField,
    this.isHiddenPassword,
    required this.onTextChange,
  });
  final String title;
  final String? hintText;
  final int? maxLinesTextField;
  final bool? isHiddenPassword;
  final ValueChanged<String> onTextChange;

  @override
  State<CardInput> createState() => _CardInputState();
}

class _CardInputState extends State<CardInput> {
  final _textFieldController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int? maxLines =
        (widget.isHiddenPassword == null || widget.isHiddenPassword == false)
            ? widget.maxLinesTextField
            : 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: kTitleTextStyle,
          textAlign: TextAlign.left,
        ),
        TextField(
          obscureText: widget.isHiddenPassword ?? false,
          onChanged: widget.onTextChange,
          controller: _textFieldController,
          style: kTextDescriptionSimpleCard,
          maxLines: maxLines,
          minLines: 1,
          decoration: InputDecoration.collapsed(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
            border: InputBorder.none,
          ),
        )
      ],
    );
  }
}
