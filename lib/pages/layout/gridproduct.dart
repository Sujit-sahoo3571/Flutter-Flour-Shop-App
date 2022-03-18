import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/pages/details/detailscreen.dart';
import 'package:flutter_flour_shop/services/products.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Center(
              child: MyFonts(
            text: "Products",
            size: 24.0,
          )),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyFonts(text: "Category"),
              MyFonts(
                text: "See All",
                color: Colors.blue,
              )
            ],
          ),
          SizedBox(height: 10.0),
          Expanded(
              child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 15.0,
                      childAspectRatio: 0.75),
                  itemBuilder: (context, index) => ItemCard(
                      product: products[index],
                      pressed: () =>
                          // Navigator.push(context,MaterialPageRoute(builder:
                          //  (context)=> DetailedScreen(product: products[index]))),
                          // Get.to(DetailedScreen(product: products[index]))
                          Get.to(()=>DetailedScreen(product: products[index])))))
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback pressed;

  const ItemCard({
    Key? key,
    required this.product,
    required this.pressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: 180.0,
        width: 180.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(width: 2.0)),
        child: Column(
          children: [
            SizedBox(
              height: 120.0,
              width: 120.0,
              child: Hero(
                tag: product.id,
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            MyFonts(
              text: product.title,
            ),
          ],
        ),
      ),
    );
  }
}
