import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/pages/cart/cartcontroller.dart';
import 'package:flutter_flour_shop/pages/cart/cartproduct.dart';
import 'package:flutter_flour_shop/pages/cart/carttotal.dart';

class CartPage extends StatelessWidget {
 
  const CartPage({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CART"),
        centerTitle: true,
      ),
      body: Column(children: [
        CartProduct(),
        CartTotal(),
        
      ]),
    );
  }
}
