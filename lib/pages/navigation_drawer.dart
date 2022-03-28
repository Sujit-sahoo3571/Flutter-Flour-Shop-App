import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/pages/drawerpage/aboutus.dart';
import 'package:flutter_flour_shop/pages/drawerpage/chatwithus.dart';
import 'package:flutter_flour_shop/pages/drawerpage/jobs.dart';
import 'package:flutter_flour_shop/pages/drawerpage/orderhistory.dart';
import 'package:flutter_flour_shop/pages/drawerpage/notification_page.dart';
import 'package:flutter_flour_shop/pages/drawerpage/updatenews.dart';
import 'package:flutter_flour_shop/pages/profile/editprofilepage.dart';
import 'package:flutter_flour_shop/services/authservice.dart';
import 'package:get/get.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  // final ProfileController _profileController = Get.put(ProfileController());

  final sizebox = const SizedBox(
    height: 16.0,
  );

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    if (AuthServices().loginCheck()) getUser();
    super.initState();
  }

  String name = 'user';
  String image =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';
  String bio = 'onoloeo';
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
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: AuthServices().loginCheck()
                        ? CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(image),
                            minRadius: 40.0,
                          )
                        : const CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(
                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                            minRadius: 40.0,
                            // ),
                          ),
                  ),
                  sizebox,
                  SizedBox(
                    width: 150.0,
                    child: MyFonts(
                      text: ' Hello! $name',
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              sizebox,
              MyFonts(
                text: "bio: $bio",
                color: Colors.white,
              ),
              sizebox,
              MyFonts(
                text:
                    ' ${AuthServices().loginCheck() ? "Email: ${AuthServices().email}" : ''}',
                color: Colors.white,
              ),
              sizebox,
              Divider(
                color: Colors.white,
              ),
              sizebox,
              buildmenuItem(
                  text: "Profile",
                  icon: Icons.person,
                  onClicked: () => selectedItem(context, 0)),
              sizebox,
              buildmenuItem(
                text: "Orders",
                icon: Icons.shopping_cart,
                onClicked: () => selectedItem(context, 1),
              ),
              sizebox,
              buildmenuItem(
                  text: "About Us",
                  icon: Icons.info,
                  onClicked: () => selectedItem(context, 2)),
              const SizedBox(
                height: 20.0,
              ),
              Divider(
                color: Colors.white70,
              ),
              sizebox,
              buildmenuItem(
                  text: "Notifications",
                  icon: Icons.notifications_on_outlined,
                  onClicked: () => selectedItem(context, 3)),
              sizebox,
              buildmenuItem(
                text: "Jobs",
                icon: Icons.card_travel,
                onClicked: () => selectedItem(context, 4),
              ),
              sizebox,
              buildmenuItem(
                text: "Updates",
                icon: Icons.update_rounded,
                onClicked: () => selectedItem(context, 5),
              ),
              sizebox,
              buildmenuItem(
                text: "Chat",
                icon: Icons.message,
                onClicked: () => selectedItem(context, 6),
              ),
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
                      Navigator.of(context).pop();
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
        Get.to(EditProfile());
        break;
      case 1:
        Get.to(OrderHistory());
        break;
      case 2:
        Get.to(AboutUs());
        break;
      case 3:
        Get.to(NotificationPage());
        break;
      case 4:
        Get.to(JobPortals());
        break;
      case 5:
        Get.to(UpdateNews());
        break;
      case 6:
        Get.to(ChatWithUs());
        break;

      default:
    }
  }

  void getUser() async {
    DocumentSnapshot snap =
        await _firestore.collection('Users').doc(_auth.currentUser!.uid).get();

    String username = (snap.data() as Map<String, dynamic>)['username'];
    String ubio = (snap.data() as Map<String, dynamic>)['bio'];
    String uimage = (snap.data() as Map<String, dynamic>)['image'];

    setState(() {
      name = username;
      image = uimage;
      bio = ubio;
    });
  }
}
