import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/pages/cart_page.dart';
import 'package:flutter_flour_shop/pages/home_page.dart';
import 'package:flutter_flour_shop/pages/profile/profilepage.dart';
// import 'package:flutter_flour_shop/pages/profile_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  final items = <Widget>[
    Icon(Icons.home, size: 30.0),
    Icon(Icons.shopping_cart, size: 30.0),
    Icon(Icons.person, size: 30.0),
  ];

  final _selectedPages = <Widget>[HomePage(), CartPage(), ProfilePage()];

  changepage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white)
        ),
        child: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: Colors.blue,
          items: items,
          index: _selectedIndex,
          onTap: changepage,
        ),
      ),
      body: _selectedPages[_selectedIndex],
    );
  }
}
