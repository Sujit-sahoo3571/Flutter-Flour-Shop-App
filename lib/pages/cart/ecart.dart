import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/pages/cart/cartcontroller.dart';
import 'package:flutter_flour_shop/pages/profile/profileproduct/newarrivalproduct.dart';
import 'package:flutter_flour_shop/services/authservice.dart';
import 'package:get/get.dart';

class Ecart extends StatelessWidget {
  Ecart({Key? key}) : super(key: key);
  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E- CART "),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              height: 40.0,
              width: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                gradient: const LinearGradient(colors: [
                  Colors.blue,
                  Colors.green,
                  Colors.orange,
                ]),
              ),
              child: Center(
                  child: MyFonts(
                text: "E-CART",
                bold: true,
                color: Colors.white,
              )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: Obx(
                () => ListView.builder(
                    itemCount: _cartController.newItems.length,
                    itemBuilder: (context, index) => CartProdcutItems(
                          cartController: _cartController,
                          items: _cartController.newItems.keys.toList()[index],
                          quantity:
                              _cartController.newItems.values.toList()[index],
                          index: index,
                        )),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyFonts(
                    text: "Total ",
                    bold: true,
                    color: Colors.green,
                    size: 20.0,
                  ),
                  Obx(() => MyFonts(
                        text: 'Rs. ${_cartController.itemsTotal}',
                        bold: true,
                        color: Colors.green,
                        size: 18.0,
                      )),
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(120.0, 40.0),
                    onPrimary: Colors.white,
                    primary: Colors.green,
                    padding: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onPressed: () {
                  if (_cartController.itemsTotal != '0.0') {
                    // print(AuthServices.isLogIn);
                    print(AuthServices().loginCheck());
                    if (!AuthServices().loginCheck()) {
                      Get.to(AuthServices().handleAuth());
                    } else {
                      //CLEAR LIST
                      _cartController.itemsEmpty();
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Container(
                                    alignment: Alignment.center,
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        border: Border.all(width: 2.0)),
                                    child: MyFonts(
                                      text: " Order Success! ",
                                      color: Colors.white,
                                    )),
                                content:
                                    Text('Thank You,\nFor Shopping With Us'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Done"))
                                ],
                              ));
                    }
                  }
                },
                child: Text("ORDER NOW"))
          ],
        ),
      ),
    );
  }
}

class CartProdcutItems extends StatelessWidget {
  final CartController cartController;
  final int index;
  final int quantity;
  final EItems items;

  CartProdcutItems(
      {required this.cartController,
      required this.index,
      required this.quantity,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 80.0,
            width: 80.0,
            child: Image.asset(
              items.img,
              width: 70.0,
              height: 70.0,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(child: Text('${items.name} ${items.price} / Unit')),
          Row(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: Colors.orange,
                      minimumSize: Size(30.0, 25.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  onPressed: () {
                    cartController.removeItemsProduct(items);
                  },
                  child: Text('-')),
              Text('$quantity'),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: Colors.green,
                      minimumSize: Size(30.0, 25.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  onPressed: () {
                    cartController.addItemsProduct(items);
                  },
                  child: Text('+')),
            ],
          )
        ],
      ),
    );
  }
}
