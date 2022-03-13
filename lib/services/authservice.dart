import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/pages/bottom_nav_page.dart';
import 'package:flutter_flour_shop/pages/loginpage.dart';
import 'package:flutter_flour_shop/services/error_handler.dart';

class AuthServices {
//is login or not ?
  static bool isLogIn = false;

// Determine if user is authenticated
  handleAuth() {
    return  StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            isLogIn = true; 
            return NavigationPage(); //HomePage()
          } else
            return LoginPage();
        });
  }

  //sign out

  signOut() {
    FirebaseAuth.instance.signOut();
    isLogIn = false;
    print(isLogIn);
  }

  //signin
  signIn(String email, String password, context) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print("sign In");
      isLogIn = true;
      print(isLogIn);
    }).catchError((e) {
      print(e.toString());
      ErrorHandler().errorDialog(context, e);
    });
  }

  // signup new users
  signUp(String email, String password) {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  //Reset
  reset(String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
