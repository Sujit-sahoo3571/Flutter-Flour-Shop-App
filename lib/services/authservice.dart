import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/pages/cart_page.dart';
import 'package:flutter_flour_shop/pages/loginpage.dart';
import 'package:flutter_flour_shop/services/error_handler.dart';
import 'package:get/get.dart';

class AuthServices {
// Determine if user is authenticated
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return CartPage(); //HomePage()
          } else {
            return LoginPage();
          }
        });
  }

  //sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //signin
  signIn(String email, String password, context) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {})
        .catchError((e) {
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

  String? email = FirebaseAuth.instance.currentUser?.email;
  bool loginCheck() {
    if (FirebaseAuth.instance.currentUser?.uid != null) {
      print(FirebaseAuth.instance.currentUser?.email);
      return true;
    } else {
      return false;
    }
  }
}
