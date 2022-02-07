import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/pages/SplashScreen.dart';
import 'package:flutter_flour_shop/pages/home.dart';

void main() {
  runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Flutter Flour Shop",
    home:Home() ,  // SplashScreen()
  ));
}
