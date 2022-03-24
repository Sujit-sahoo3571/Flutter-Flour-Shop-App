import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/pages/profile/profilecontroller.dart';
import 'package:flutter_flour_shop/pages/profile/profilepage.dart';
import 'package:flutter_flour_shop/pages/profile/profileproduct/newarrivalproduct.dart';
import 'package:flutter_flour_shop/pages/profile/profileproduct/profileproductdescriptions.dart';
import 'package:get/get.dart';

class ProfileProduct extends StatelessWidget {
  ProfileProduct({Key? key}) : super(key: key);
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Electronic Products"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(ProfilePage());
                },
                icon: Icon(Icons.person)),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyFonts(
                      text: "New Arrivals",
                      color: Colors.green,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                    padding: EdgeInsets.all(7.0),
                    height: 230.0,
                    child: scrollnames(coverpage)),
                Container(
                    alignment: Alignment.topLeft,
                    child: MyFonts(
                      text: "Also Availible",
                      color: Colors.green,
                    )),
                Container(
                    padding: EdgeInsets.all(7.0),
                    height: 230.0,
                    child: scrollnames(otherstuffs)),
                Container(
                    alignment: Alignment.topLeft,
                    child: MyFonts(
                      text: "New Products",
                      color: Colors.green,
                    )),
                Container(
                    padding: EdgeInsets.all(7.0),
                    height: 230.0,
                    child: scrollnames(otherstuffs)),
                Container(
                    alignment: Alignment.topLeft,
                    child: MyFonts(
                      text: "Now On Sales",
                      color: Colors.green,
                    )),
                Container(
                    padding: EdgeInsets.all(7.0),
                    height: 230.0,
                    child: scrollnames(otherstuffs))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

ListView scrollnames(List<ProductOfProducts> titlenames) {
  return ListView.builder(
    itemCount: titlenames.length,
    itemBuilder: (context, index) =>
        ProductCard(profileproduct: titlenames[index]),
    scrollDirection: Axis.horizontal,
    controller: PageController(viewportFraction: 0.70),
  );
}

class ProductCard extends StatelessWidget {
  final ProductOfProducts profileproduct;
  ProductCard({Key? key, required this.profileproduct}) : super(key: key);
  final ProfileController _profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProfileProductDescriptions(
          productName: profileproduct.name,
          profileproduct: profileproduct.product,
        ));
      },
      child: SizedBox(
        width: 170.0,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: Image.asset(
                  profileproduct.image,
                  fit: BoxFit.cover,
                  height: 60.0,
                  width: 80.0,
                ),
              ),
              MyFonts(
                text: profileproduct.name,
                bold: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
