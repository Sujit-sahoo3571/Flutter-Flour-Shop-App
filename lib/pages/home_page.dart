import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/pages/layout/mgridview.dart';
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
        centerTitle: true,
        title: Text("Home"),
        actions: [
          IconButton(
              tooltip: "Log Out",
              onPressed: () {
                AuthServices().signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            height: 60.0,
            child: MyFonts(text: "BUY MORE", color: Colors.green, size: 24.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyFonts(
                  text: "Categories",
                ),
                MyFonts(
                  text: "See All",
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          MyGrid(),
        ],
      ),
    );
  }
}
