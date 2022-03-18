import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/pages/profile/profileproduct/newarrivalproduct.dart';
import 'package:flutter_flour_shop/pages/profile/profileproduct/profileproductinfo.dart';
import 'package:get/get.dart';

class ProfileProductDescriptions extends StatelessWidget {
  const ProfileProductDescriptions(
      {Key? key, required this.profileproduct, required this.productName})
      : super(key: key);
  final texttitle = 'Product Categories';
  final List<NewArrival> profileproduct;
  final productName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(texttitle)),
      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Container(
                  height: 40.0,
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: const LinearGradient(
                          colors: [Colors.blue, Colors.green, Colors.yellow])),
                  child: Center(
                    child: MyFonts(
                      text: "Categories: $productName",
                      bold: true,
                      color: Colors.white,
                    ),
                  )),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: GridView.builder(
                    itemCount: profileproduct.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 15.0,
                        childAspectRatio: 0.75),
                    itemBuilder: (context, index) {
                      return ProductItemCards(
                        items: profileproduct[index],
                      );
                    }),
              ),
            ],
          )),
    );
  }
}

class ProductItemCards extends StatelessWidget {
  final NewArrival items;
  const ProductItemCards({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Get.to(ProfileProductInfo(items: items))},
      child: SizedBox(
        width: 170.0,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                items.image[0],
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
              MyFonts(
                text: items.name,
                bold: true,
                size: 14.0,
              ),
              MyFonts(
                text:
                    '${percentSee(items.mrp.toDouble(), items.price.toDouble())}%OFF',
                color: Colors.green,
                size: 12.0,
                bold: true,
              ),
              MyFonts(
                text: ' ${items.price.toStringAsFixed(2)}',
                color: Colors.green,
              ),
              Text(
                'Rs. ${items.mrp.toStringAsFixed(2)}',
                style: TextStyle(
                    color: Colors.grey, decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String percentSee(double mrp, double sp) {
    double gain = (mrp - sp) / mrp * 100;
    return gain.toStringAsFixed(2);
  }
}
