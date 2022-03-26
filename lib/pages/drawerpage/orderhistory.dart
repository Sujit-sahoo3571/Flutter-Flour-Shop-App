import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ORDERS"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: MyFonts(text: "Order History is Empty!", size: 20.0,)),
          ],
        ),
      ),
      
    );
  }
}