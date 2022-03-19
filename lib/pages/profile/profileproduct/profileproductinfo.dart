import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/pages/cart/cartcontroller.dart';
import 'package:flutter_flour_shop/pages/cart/ecart.dart';
import 'package:flutter_flour_shop/pages/profile/profileproduct/newarrivalproduct.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProfileProductInfo extends StatelessWidget {
  ProfileProductInfo({
    Key? key,
    required this.items,
  }) : super(key: key);
  final NewArrival items;
  final CartController _cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            height: 40.0,
            width: MediaQuery.of(context).size.width * .4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.green, Colors.orange]),
            ),
            child: Center(
                child: MyFonts(
              text: "DETAILS",
              bold: true,
              color: Colors.white,
            )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(children: [
              CarouselSlider.builder(
                  itemCount: items.image.length,
                  itemBuilder: (context, index, realindex) {
                    return buildImage(items.image, index);
                  },
                  options: CarouselOptions(
                      height: 330.0,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        _cartController.dotindex.value = index;
                      })),
              SizedBox(
                height: 5.0,
              ),
              buildIndicator(),
            ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            margin: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(width: 2.0)),
            child: Text(
                '${items.desc} loremipsum LOREM ISPSUM  lorem ipsum lorem ipsum'
                'lorem ipsum lorem ipsum loerem ipsum lorem ipsum lorem  '),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15.0),
                  onPrimary: Colors.white,
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
              onPressed: () {
                addProductItem(items);
                Get.off(() => Ecart());
              },
              child: Text("ADD TO CART")),
        ]),
      ),
    );
  }

  Widget buildImage(image, int index) {
    return Container(
      margin: EdgeInsets.all(12.0),
      color: Colors.grey,
      child: Image.asset(
        image[index],
        fit: BoxFit.cover,
      ),
    );
  }

  buildIndicator() => Obx(
        () => AnimatedSmoothIndicator(
          activeIndex: _cartController.dotindex.value,
          count: items.image.length,
        ),
      );

  void addProductItem(NewArrival item) {
    final EItems items;
    items = EItems(
        id: item.id, img: item.image[0], name: item.name, price: item.price);
    _cartController.addItemsProduct(items);
    print(items);
  }
}
