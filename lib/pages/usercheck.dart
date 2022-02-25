import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/pages/home_page.dart';
import 'package:flutter_flour_shop/services/authservice.dart';

class UserSelect extends StatelessWidget {
  const UserSelect({Key? key}) : super(key: key);

  final loremText =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ultrices nisl nisl, quis consequat turpis molestie eget. Aliquam purus massa, tincidunt eget felis quis, ultrices congue lorem. Donec dui quam, facilisis eget orci nec, posuere venenatis felis. Pellentesque ut lectus vitae enim vulputate";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello User"),
      ),
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
                child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      'assets/images/gehu.jpg',
                      fit: BoxFit.cover,
                    ))),
            Center(
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Container(
                        width: 180.0,
                        height: 180.0,
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/tree.png',
                          height: 96.0,
                        ),
                        // Icon(Icons.add_business_outlined, size: 120.0,color:Colors.white,),
                      ),
                    ),
                    MyFonts(
                      text: "Welcome to Flour Shop",
                      color: Colors.white,
                      size: 28.0,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    MyFonts(
                        text: "this is a demo purpose design",
                        color: Colors.white,
                        size: 20.0),
                    Padding(
                        padding: EdgeInsets.all(20.0),
                        child: MyFonts(
                            text: loremText, color: Colors.white, size: 16.0)),
                    SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                        width: 250.0,
                        height: 60.0,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePage()));
                            },
                            child: Text('Guest'))),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: 250.0,
                      height: 60.0,
                      child: ElevatedButton(
                        onPressed: () {
                           Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AuthServices().handleAuth()));
                        },
                        child: Text('LogIn'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
