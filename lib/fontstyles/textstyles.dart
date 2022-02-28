import 'package:flutter/material.dart';

class MyFonts extends StatelessWidget {
  double size;
  Color color;
  String text;
  bool bold; 
  MyFonts({
    required this.text,
    this.color = Colors.black,
    this.size = 16.0,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontFamily: "Tureno",
       fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
      
      ),
    );
  }
}
