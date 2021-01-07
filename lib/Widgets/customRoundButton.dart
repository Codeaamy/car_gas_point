
import 'package:flutter/material.dart';

class customRoundButton extends StatelessWidget {

  customRoundButton({this.title, this.textColor,this.color, this.height, this.width, @required this.onPressed});

  final Color color;
  final String title;
  final Function onPressed;
  final double width;
  final double height;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: width,
          height: height,
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
