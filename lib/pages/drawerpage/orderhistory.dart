import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/pages/admin/productimages.dart';
import 'package:flutter_flour_shop/pages/cart/cartcontroller.dart';
import 'package:get/get.dart';

class OrderHistory extends StatelessWidget {
  OrderHistory({Key? key}) : super(key: key);

  final CartController _cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ORDERS"),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(ProductImages());
              },
              icon: Icon(Icons.admin_panel_settings))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: MyFonts(
              text: "Order History is Empty!",
              size: 20.0,
            )),
            Container(
              height: 700.0,
            )
          ],
        ),
      ),
    );
  }
}
