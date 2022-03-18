import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/pages/profile/editprofilepage.dart';
import 'package:flutter_flour_shop/pages/profile/profilecontroller.dart';
import 'package:flutter_flour_shop/services/authservice.dart';
import 'package:flutter_flour_shop/services/products.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Profile"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                if (AuthServices().loginCheck()) {
                  AuthServices().signOut();
                  Get.snackbar("Sign Out", "You Logged Out Successfully");
                } else {
                  Get.snackbar("Try LogIn First", "You're Not Logged In yet ");
                }
              },
              tooltip: "Log Out",
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(
                      () => CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage:
                            _profileController.isProfilePicPathSet.value == true
                                ? FileImage(File(_profileController
                                    .profilePicPath.value)) as ImageProvider
                                : AssetImage(
                                    "assets/images/manwoman/profilepic.png"),
                        minRadius: 50.0,
                      ),
                    ),
                    Obx(() => followers(
                        '${_profileController.follower()}', "Followers")),
                    Obx(() => followers(
                        '${_profileController.follower()}', "Followings")),
                  ],
                ),
                SizedBox(
                  height: 7.0,
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    alignment: Alignment.topLeft,
                    child: Obx(
                      () =>
                          // child:
                          MyFonts(
                        text: _profileController.name.value,
                        bold: true,
                        size: 22.0,
                      ),
                    )),
                Container(
                    alignment: Alignment.topLeft,
                    child: Obx(()=>MyFonts(text: _profileController.bio.value))),
                SizedBox(
                  height: 7.0,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      minimumSize: Size(250.0, 42.0),
                    ),
                    onPressed: () {
                      Get.to(() => EditProfile());
                    },
                    child: Text("Edit Profile")),
                SizedBox(
                  height: 7.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyFonts(text: "Friends"),
                    MyFonts(
                      text: "See All",
                      color: Colors.blue,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                    padding: EdgeInsets.all(7.0),
                    height: 230.0,
                    child: scrollnames()),
                Container(
                    alignment: Alignment.topLeft,
                    child: MyFonts(
                      text: "Popular Search",
                      color: Colors.green,
                    )),
                Container(
                    padding: EdgeInsets.all(7.0),
                    height: 230.0,
                    child: scrollnames())
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView scrollnames() {
    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) => PeopleCard(people: people[index]),
      scrollDirection: Axis.horizontal,
      controller: PageController(viewportFraction: 0.70),
    );
  }

  Column followers(String value, String name) {
    return Column(
      children: [
        MyFonts(
          text: value,
          bold: true,
          size: 20.0,
        ),
        MyFonts(
          text: name,
        )
      ],
    );
  }
}

class PeopleCard extends StatelessWidget {
  final People people;
  PeopleCard({Key? key, required this.people}) : super(key: key);
  final ProfileController _profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(people.image),
              // ExactAssetImage(people.image),
              minRadius: 40.0,
            ),
            MyFonts(text: people.name),
            MyFonts(text: people.status),
            Obx(
              () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(90.0, 30.0),
                    primary: (_profileController.friends.contains(people))
                        ? Colors.green
                        : Colors.blue,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    if (!_profileController.friends.contains(people)) {
                      _profileController.addFriends(people);
                    } else {
                      _profileController.removeFriends(people);
                    }
                  },
                  child: Text(_profileController.friends.contains(people)
                      ? "Request"
                      : "Follow")),
            )
          ],
        ),
      ),
    );
  }
}
