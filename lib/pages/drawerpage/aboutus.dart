import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);
  static final _sizebox = SizedBox(
    height: 10.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("About Us"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyFonts(
              text: "Flutter Flour Shop ",
              color: Colors.green,
              size: 24.0,
            ),
            _sizebox,
            MyFonts(
                text: "This Application Design for Deliver the best product"
                    " In Your Area with the less time."),
            _sizebox,
            MyFonts(
                text: "FlourShop allow you to buy all the items"
                    " You see in the list and willing to add more items "
                    "as per the demand so you don't have to wait for days to get"
                    "Your product as well as you can visit near to the store"
                    " To check the product quality and taste/Demo."),
            _sizebox,
            MyFonts(
                text: "We are planning to upgrade the appliction"
                    " with  more availible items and the free delivery services"
                    " as soon as possible, Thank you for Your patience!"),
            _sizebox,
            MyFonts(text: "for more quries You can write to us : "),
            _sizebox,
            GestureDetector(onTap: _ontap, child: MyFonts(text: "Click here", color: Colors.blue,))
          ],
        ),
      ),
    );
  }

  void _ontap() async {
    const url = "https://forms.gle/MZ4Qz8hbR1Q7T2VV9";
    try {
      if (await canLaunch(url))
        launch(url);
      else
        throw 'could not launch $url';
    } catch (e) {
      print(e.toString());
    }
  }
}
