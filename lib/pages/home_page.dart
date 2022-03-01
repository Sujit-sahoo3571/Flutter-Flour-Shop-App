import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/pages/layout/gridproduct.dart';
import 'package:flutter_flour_shop/pages/notification_page.dart';
import 'package:flutter_flour_shop/services/authservice.dart';
import 'package:flutter_flour_shop/services/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NotificationPage()));
              },
              icon: Icon(Icons.notifications)),
          IconButton(
              tooltip: "Log Out",
              onPressed: () {
                AuthServices().signOut();
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: Categories(),
      
      );
  }

 
}