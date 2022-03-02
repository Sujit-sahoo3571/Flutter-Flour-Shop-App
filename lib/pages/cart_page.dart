import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/pages/cart/cartcontroller.dart';
import 'package:flutter_flour_shop/pages/cart/cartproduct.dart';
import 'package:flutter_flour_shop/pages/cart/carttotal.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  final CartController controller = Get.put(CartController());
   CartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("CART"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))
          ],
        ),
        body: ListView(children: [
          CartProduct(),
          CartTotal(),
          
          
        ]),
      ),
    );
  }

 
}
