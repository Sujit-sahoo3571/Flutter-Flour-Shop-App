import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/pages/layout/mgridview.dart';
import 'package:flutter_flour_shop/services/authservice.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  int followers=0, following = 0;
  String name = 'Hero';
  String bio = 'Live Your Life';
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("PROFILE"),
          centerTitle: true,
          actions: [
            IconButton(
                tooltip: "Log Out",
                onPressed: () {
                  AuthServices().signOut();
                },
                icon: Icon(Icons.logout)),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          children: [
            SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(
                  backgroundImage: ExactAssetImage(
                      'assets/images/manwoman/maheshbabu.jpg'
                      // NetworkImage('https://images.unsplash.com/photo-1524250502761-1ac6f2e30d43?ixid=MnwzMDU2NzR8MHwxfHNlYXJjaHwyfHx3b21hbnxlbnwwfHx8fDE2NDU5MzgwNzE&ixlib=rb-1.2.1',
                      ),
                  radius: 60.0,
                ),
                profileheader('${followers}', 'Followers'),
                profileheader('${following}', 'Following'),
              ],
            ),
            Container(
                padding: EdgeInsets.only(left: 10.0, top: 10.0),
                alignment: Alignment.topLeft,
                child: profileheader(name, bio)),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 8.0,
                    minimumSize: Size(60.0, 50.0),
                  ),
                  onPressed: () {},
                  child: MyFonts(
                    text: "Edit Profile",
                    bold: true,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyFonts(text: "Discover People"),
                MyFonts(
                  text: "See All",
                  color: Colors.blue,
                ),
              ],
            ),
            Container(
              height: 400.0,
              padding: EdgeInsets.all(10.0),
              child: MyGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Column profileheader(String number, String heading) {
    return Column(
      children: [
        MyFonts(
          text: number,
          size: 18,
          bold: true,
        ),
        MyFonts(
          text: heading,
          size: 13,
        )
      ],
    );
  }
}
