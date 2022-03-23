import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/pages/notification_page.dart';
import 'package:flutter_flour_shop/pages/profile/profilecontroller.dart';
import 'package:flutter_flour_shop/pages/profile/profileproduct/profileproduct.dart';
import 'package:flutter_flour_shop/services/authservice.dart';
import 'package:get/get.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key}) : super(key: key);
  final ProfileController _profileController = Get.put(ProfileController());
  final sizebox = const SizedBox(
    height: 16.0,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Material(
          color: Colors.blue,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(
                    () => CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: _profileController
                                  .isProfilePicPathSet.value ==
                              true
                          ? FileImage(
                                  File(_profileController.profilePicPath.value))
                              as ImageProvider
                          : AssetImage("assets/images/manwoman/profilepic.png"),
                      minRadius: 50.0,
                    ),
                  ),
                  Obx(
                    () => Column(
                      children: [
                        MyFonts(
                          text: _profileController.name.value,
                          color: Colors.white,
                        ),
                        sizebox,
                        MyFonts(
                          text:
                              ' ${AuthServices().loginCheck() ? AuthServices().email! : ""}',
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              sizebox,
              Divider(
                color: Colors.white,
              ),
              sizebox,
              buildmenuItem(
                  text: "Peoples",
                  icon: Icons.people,
                  onClicked: () => selectedItem(context, 0)),
              sizebox,
              buildmenuItem(text: "favorite", icon: Icons.favorite),
              sizebox,
              buildmenuItem(
                text: "Orders",
                icon: Icons.shopping_cart,
              ),
              sizebox,
              buildmenuItem(text: "About Us", icon: Icons.info),
              const SizedBox(
                height: 20.0,
              ),
              Divider(
                color: Colors.white70,
              ),
              sizebox,
              buildmenuItem(text: "PlugIn", icon: Icons.account_tree_outlined),
              sizebox,
              buildmenuItem(
                  text: "Notifications",
                  icon: Icons.notifications_on_outlined,
                  onClicked: () => selectedItem(context, 5)),
              sizebox,
              buildmenuItem(text: "Updates", icon: Icons.update_rounded),
              sizebox,
              Divider(
                color: Colors.white,
              ),
              sizebox,
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: Colors.red,
                      minimumSize: Size(100.0, 45.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  onPressed: () {
                    // Get.to(ProfilePage());
                    if (AuthServices().loginCheck()) {
                      AuthServices().signOut();
                      Get.snackbar("Sign Out", "You Logged Out Successfully");
                    } else {
                      Get.snackbar(
                          "Try LogIn First", "You're Not Logged In yet ");
                    }
                  },
                  child: Text("Log Out")),
            ],
          ),
        ),
      ),
    );
  }

  buildmenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    const color = Colors.white;
    const hover = Colors.white70;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
        size: 35.0,
      ),
      hoverColor: hover,
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      onTap: () => onClicked?.call(), // Improtant
    );
  }

  selectedItem(BuildContext context, int i) {
    Navigator.of(context).pop();
    switch (i) {
      case 0:
        Get.to(ProfileProduct());
        break;
      case 5:
        Get.to(NotificationPage());
        break;
      default:
    }
  }
}
