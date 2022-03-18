// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/pages/cart/cartcontroller.dart';
import 'package:flutter_flour_shop/pages/cart_page.dart';
import 'package:flutter_flour_shop/services/products.dart';
import 'package:get/get.dart';

class ItemDescription extends StatefulWidget {
  final Product product;
  const ItemDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ItemDescription> createState() => _ItemDescriptionState();
}

class _ItemDescriptionState extends State<ItemDescription> {
  bool fav = false;
  int count = 0;
  String? netweight = '100Gm';
  double price = 50.0;
  final  cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    final quantities = widget.product.price.keys.toList();
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: Colors.red),
        child: Column(
          children: [
            Stack(
              children: [
                productDescription(size, quantities),
                productLikes(),
                likeCounter(),
                productImage(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Positioned productImage() {
    return Positioned(
      top: 150.0,
      right: 50.0,
      child: Hero(
          tag: widget.product.id,
          child: Image.asset(
            widget.product.image,
            fit: BoxFit.cover,
            width: 180.0,
            height: 180.0,
          )),
    );
  }

  Positioned likeCounter() {
    return Positioned(
      top: 250.0,
      left: 20.0,
      child: Column(children: [
        IconButton(
            onPressed: () {
              setState(() {
                fav = fav ? false : true;
                count = fav ? ++count : --count;
              });
            },
            icon: Icon(
              fav ? Icons.favorite : Icons.favorite_border_rounded,
              size: 40.0,
              color: Colors.red,
            )),
        Text(count.toString()),
      ]),
    );
  }

  Positioned productLikes() {
    return Positioned(
        top: 10.0,
        left: 10.0,
        child: MyFonts(
          text: widget.product.title,
          color: Colors.white,
          size: 24.0,
          bold: true,
        ));
  }

  Container productDescription(Size size, List<String> quantities) {
    return Container(
        height: 500.0,
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.only(top: size.height * 0.3),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
        child: Column(
          children: [
            SizedBox(
              height: 90.0,
            ),
            MyFonts(
              text: widget.product.description,
            ),
            SizedBox(
              height: 25.0,
              child: MyFonts(
                text: "Select netweight",
                bold: true,
                color: Colors.red,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // SizedBox(height: 10.0),
                MyFonts(
                  text: 'Price: Rs. ${widget.product.price[netweight]}',
                  bold: true,
                  size: 22.0,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 120.0,
                  height: 60.0,
                  child: DropdownButton<String>(
                    value: netweight,
                    items: quantities
                        .map((item) => DropdownMenuItem<String>(
                            value: item, child: Text(item)))
                        .toList(),
                    onChanged: (String? value) {
                      setState(() {
                        netweight = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 18.0),
                      minimumSize: Size(120, 50),
                      primary: Colors.orange,
                      // onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      productInCart();
                      Get.off(CartPage());
                    },
                    child: MyFonts(
                      text: "ADD TO CART",
                      bold: true,
                      color: Colors.white,
                    )),
                SizedBox(
                  height: 10.0,
                ),
              ],
            )
          ],
        ));
  }

  void productInCart() {
    final Items items;

    items = Items(
        id: widget.product.id,
        imageurl: widget.product.image,
        title: widget.product.title,
        price: widget.product.price[netweight],
        netweight: netweight);
    cartController.addProduct(items);
  }
}
