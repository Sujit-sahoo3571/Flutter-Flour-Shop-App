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
      return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
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
            SizedBox(
              height: 10.0,
            ),
            // orderButton(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    minimumSize: Size(160.0, 45.0)),
                onPressed: () {
                  if (controller.total != '0.0') {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Container(
                                alignment: Alignment.center,
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(width: 2.0)
                                ),
                                child: MyFonts( text: " ORDER SUCCESS ", color: Colors.white,)),
                              content: Text('Thank You Sir/Madam😍'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Done"))
                              ],
                            ));
                  }
                },
                child: Text("ORDER NOW"))
          ],
        ),
      );
    });
  }
}

  // ElevatedButton orderButton() {
  // return ElevatedButton(
  //     style: ElevatedButton.styleFrom(
  //       textStyle: TextStyle(fontSize: 20.0),
  //       minimumSize: Size(120, 50),
  //       primary: Colors.green,
  //       onPrimary: Colors.white,
  //     ),
  //     onPressed: () {
  //       if (controller.total != '0.0') {
  //         print("order success ");
  //         // showAlert(context, "header", "body");
  //         return AlertDialog(
  //           title: Text("me"),

  //         );
  //       }
  //     },
  //     child: Text("ORDER NOW"));
// }

  // showAlert(context, String header, String body) {
  //   AlertDialog(
  //     title: Text(header),
  //     content: Text(body),
  //     actions: [
  //       TextButton(onPressed: () {}, child: Text("Done")),
  //     ],
  //   );
  //   showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(),
  //       barrierDismissible: false);
  // }
// }
