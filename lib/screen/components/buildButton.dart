import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final double height;
  final String text;
  final Color color;
  final Function onPressed;

  const BuildButton(
      {Key key, this.height, this.text, this.color, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * height,
      decoration: BoxDecoration(
        color: color,
        boxShadow:[
          BoxShadow(
            blurRadius: 7,
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 4,
            offset: Offset(0,3)
          ),
        ],
      ),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(width: 1, style: BorderStyle.solid),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.white),
        ),
      ),
    );
  }
}
