import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/constants.dart';
import 'package:todolistapp/models/tasks/providers/input_provider/add_project_input_provider.dart';
import 'package:todolistapp/models/tasks/providers/input_provider/input_provider.dart';

class CardInput extends StatefulWidget {
  const CardInput({
    super.key,
    required this.title,
    this.hintText,
    this.maxLinesTextField,
    this.isHiddenPassword,
  });
  final String title;
  final String? hintText;
  final int? maxLinesTextField;
  final bool? isHiddenPassword;

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
    return Consumer<AddProjectProvider>(
      builder: (BuildContext context, AddProjectProvider projectProvider,
              Widget? child) =>
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: kTitleTextStyle,
            textAlign: TextAlign.left,
          ),
          TextField(
            obscureText: widget.isHiddenPassword ?? false,
            onChanged: (newVal) {
              if (widget.title == "Project Name") {
                projectProvider.addInputFieldProvider(
                    newVal, InputTextFieldType.name);
              } else if (widget.title == "Description") {
                projectProvider.addInputFieldProvider(
                    newVal, InputTextFieldType.description);
              } else if (widget.title == "Email") {
                projectProvider.addUserLoginProvider(newVal, "");
              } else if (widget.title == "Password") {
                projectProvider.addUserLoginProvider("", newVal);
              }
            },
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
      ),
    );
  }
}
