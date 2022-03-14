import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/services/authservice.dart';
import 'package:flutter_flour_shop/services/products.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
                } else
                {
                   print("not logged in ");
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
                    CircleAvatar(
                      backgroundImage:
                          ExactAssetImage("assets/images/manwoman/boy3.jpg"),
                      minRadius: 50.0,
                    ),
                    followers('0', "Followers"),
                    followers('0', "Followings"),
                  ],
                ),
                SizedBox(
                  height: 7.0,
                ),
                // Container(

                Container(
                    margin: EdgeInsets.all(5.0),
                    alignment: Alignment.topLeft,
                    child: MyFonts(
                      text: "Soco",
                      bold: true,
                      size: 22.0,
                    )),
                Container(
                    alignment: Alignment.topLeft,
                    child: MyFonts(text: "Can You Teach Me How To Live.?")),
                //   child: followers("Soco", "Can You Teach Me How To Live.?")),
                SizedBox(
                  height: 7.0,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      minimumSize: Size(250.0, 42.0),
                    ),
                    onPressed: () {},
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
                      child: MyFonts(text: "Popular Search", color: Colors.green,)),
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
  const PeopleCard({Key? key, required this.people}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundImage: ExactAssetImage(people.image),
              // child: Image.asset(people.image, fit: BoxFit.cover,),
              minRadius: 40.0,
            ),
            MyFonts(text: people.name),
            MyFonts(text: people.status),
            ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(90.0, 30.0)),
                onPressed: () {},
                child: Text("Follow"))
          ],
        ),
      ),
    );
  }
}
