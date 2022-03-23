import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/pages/layout/gridproduct.dart';
import 'package:flutter_flour_shop/pages/navigation_drawer.dart';
import 'package:flutter_flour_shop/pages/notification_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
      ),
      body: Categories(),
    );
  }
}
