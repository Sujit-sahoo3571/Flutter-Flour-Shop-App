import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/pages/SplashScreen.dart';
import 'package:flutter_flour_shop/pages/loginpage.dart';
import 'package:flutter_flour_shop/pages/usercheck.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Flour Shop",
      home: LoginPage()        //UserSelect(), // SplashScreen()
    );
  }
}
