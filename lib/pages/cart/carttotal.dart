import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/pages/cart/cartcontroller.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print(controller.total.runtimeType);
      return Container(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyFonts(
              text: "TOTAL: ",
              bold: true,
              size: 21.0,
              color: Colors.green,
            ),
            MyFonts(
              text: 'Rs.  ${controller.total}',
              bold: true,
              size: 20.0,
              color: Colors.green,
            ),
          ],
        ),
      );
    });
  }
}
