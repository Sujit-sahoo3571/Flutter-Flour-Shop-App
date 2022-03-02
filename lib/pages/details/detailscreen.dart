import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/pages/details/itemdescription.dart';
import 'package:flutter_flour_shop/services/products.dart';

class DetailedScreen extends StatelessWidget {
  final Product product;
  const DetailedScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Product Details"),
      ),
      body: ItemDescription(product: product),
    );
  }
}
