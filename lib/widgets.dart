import 'package:flutter/material.dart';
import 'colors.dart';

class IconText extends StatelessWidget {
  final String text;
  final IconData icon;
  final action;

  const IconText(
      {Key? key, required this.text, required this.icon, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          )),
          padding:
              MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20))),
      onPressed: action,
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: kprimaryColor,
          ),
          Text(
            text,
            style: TextStyle(color: kprimaryColor),
          )
        ],
      ),
    );
  }
}
