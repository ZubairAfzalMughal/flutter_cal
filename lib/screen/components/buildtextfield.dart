import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildTextInput extends StatelessWidget {
  final Function onChange;
  final String placeholder;
  final TextEditingController controller;

  const BuildTextInput(
      {Key key, this.onChange, this.placeholder, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        textAlign: TextAlign.end,
        controller: controller,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700,
        ),
        maxLines: 2,
        keyboardType: TextInputType.number,
        decoration:
            InputDecoration(hintText: placeholder, border: InputBorder.none),
      ),
    );
  }
}
