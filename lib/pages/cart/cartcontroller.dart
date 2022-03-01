import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/services/products.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var _products = {}.obs;

  // add product
  void addProduct(
    Items product,
  ) {
    if (_products.containsKey(product)) {
      // print(_products);
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    Get.snackbar(
      "Product Added ",
      "You've Added ${product.title} ${product.price} in your cart",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 1),
    );
  }

  //get product
  get product => _products;

  // get quantity => _products[product];

  // remove product
  void removeProduct(Items product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  // product sub total
  get productsubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  // get total
  get total => _products.isEmpty ? '0.0' : _products.entries
      .map((product) => product.key.price *  product.value)
      .toList().reduce((value, element) => value + element ).toStringAsFixed(2);
}
