import 'package:flutter/material.dart';

class MyFonts extends StatelessWidget {
  double size;
  Color color;
  String text;
  MyFonts({
    required this.text,
    this.color = Colors.black,
    this.size = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontFamily: "Tureno"),
    );
  }
}
