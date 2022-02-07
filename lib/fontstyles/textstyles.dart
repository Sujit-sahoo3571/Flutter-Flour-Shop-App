import 'package:flutter/material.dart';

class MyFonts extends StatelessWidget {
  double size;
  Color color;
  String text;
  MyFonts({
    required this.text,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}
