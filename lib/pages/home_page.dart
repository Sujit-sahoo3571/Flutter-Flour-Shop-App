import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/services/authservice.dart';

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
        title: Text("Home"),
      ),
      body: ListView(
        children: [
          Text("You Have Logged In "),
          ElevatedButton(
              onPressed: () {
                AuthServices().signOut();
              },
              child: Text("LogOut")),
        ],
      ),
    );
  }
}
