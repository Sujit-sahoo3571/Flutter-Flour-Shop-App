import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/pages/usercheck.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        child: Image.asset(
          'assets/images/shoplogo.png',
          width: 200.0,
          height: 200.0,
        ),
      ),
      nextScreen: UserSelect(),
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: Colors.blue,
    );
  }
}
