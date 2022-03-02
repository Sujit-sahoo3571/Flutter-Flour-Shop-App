import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/pages/cart/cartcontroller.dart';
import 'package:flutter_flour_shop/services/products.dart';
import 'package:get/get.dart';

class CartProduct extends StatelessWidget {
  final CartController controller = Get.find();
  CartProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((() => Container(
          decoration: BoxDecoration(border: Border.all(width: 2.0)),
          child: SizedBox(
            height: 510.0,
            child: ListView.builder(
                itemCount: controller.product.length,
                itemBuilder: (context, index) => CartProductCard(
                      controller: controller,
                      product: controller.product.keys.toList()[index],
                      quantity: controller.product.values.toList()[index],
                      index: index,
                    )),
          ),
        )));
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Items product;
  final int quantity;
  final int index;

  const CartProductCard(
      {Key? key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CircleAvatar(
          radius: 40.0,
          backgroundImage: ExactAssetImage(product.imageurl),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
            child:
                Text('${product.title} ${product.price}/${product.netweight}')),
        Row(
          children: [
            InkWell(
              onTap: (() {
                controller.addProduct(product);
              }),
              child: Container(
                  alignment: Alignment.center,
                  width: 30.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blue,
                  ),
                  child: MyFonts(
                    text: '+',
                    color: Colors.white,
                  )),
            ),
            Container(
                alignment: Alignment.center,
                width: 30.0,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text('$quantity')),
            InkWell(
              onTap: (() {
                controller.removeProduct(product);
              }),
              child: Container(
                  alignment: Alignment.center,
                  width: 30.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blue,
                  ),
                  child: MyFonts(
                    text: '-',
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ]),
    );
  }
}
