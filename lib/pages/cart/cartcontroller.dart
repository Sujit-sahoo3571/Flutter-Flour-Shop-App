import 'package:flutter_flour_shop/pages/profile/profileproduct/newarrivalproduct.dart';
import 'package:flutter_flour_shop/services/products.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var _products = {}.obs;

  // add product
  void addProduct(
    Items product,
  ) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
  }

  //get product
  get product => _products;

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
  get total => _products.isEmpty
      ? '0.0'
      : _products.entries
          .map((product) => product.key.price * product.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2);

  void empty() {
    _products.clear();
  }

  // dot index
  var dotindex = 0.obs;
  // Electronic products
  var _newItems = {}.obs;

  // add product
  void addItemsProduct(
    EItems product,
  ) {
    if (_newItems.containsKey(product)) {
      _newItems[product] += 1;
    } else {
      _newItems[product] = 1;
    }
  }

  // remove product
  void removeItemsProduct(EItems product) {
    if (_newItems.containsKey(product) && _newItems[product] == 1) {
      _newItems.removeWhere((key, value) => key == product);
    } else {
      _newItems[product] -= 1;
    }
  }

  //get product
  get newItems => _newItems;

  // product sub total
  get itemssubtotal => _newItems.entries
      .map((product) => product.key.price * product.value)
      .toList();

  // get total
  get itemsTotal => _newItems.isEmpty
      ? '0.0'
      : _newItems.entries
          .map((product) => product.key.price * product.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2);

  void itemsEmpty() {
    _newItems.clear();
  }

 
}
