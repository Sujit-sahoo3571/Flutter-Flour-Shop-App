import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:flutter_flour_shop/services/products.dart';
import 'package:get/get.dart';

class MyGrid extends StatelessWidget {
  const MyGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: people.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            childAspectRatio: 0.75),
        itemBuilder: (context, index) =>
            PeopleCard(people: people[index], pressed: () {}
                //  => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             DetailedScreen(product: products[index])

                //             )
                //             ),
                ));
  }

  // 'https://images.unsplash.com/photo-1524250502761-1ac6f2e30d43?ixid=MnwzMDU2NzR8MHwxfHNlYXJjaHwyfHx3b21hbnxlbnwwfHx8fDE2NDU5MzgwNzE&ixlib=rb-1.2.1'

}

class PeopleCard extends StatefulWidget {
  final People people;
  final VoidCallback pressed;

  const PeopleCard({
    Key? key,
    required this.people,
    required this.pressed,
  }) : super(key: key);

  @override
  State<PeopleCard> createState() => _PeopleCardState();
}

class _PeopleCardState extends State<PeopleCard> {
  String follow = "Follow";
  int followCount = 0;
  bool isEnable = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.pressed,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        elevation: 8.0,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundImage: ExactAssetImage(widget.people.image),
                //  NetworkImage(people.image),
                radius: 40.0,
              ),
              MyFonts(
                text: widget.people.name,
              ),
              MyFonts(
                text: widget.people.status,
                color: widget.people.status == 'online'
                    ? Colors.green
                    : Colors.black,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: isEnable ? Colors.blue : Colors.green,
                      onPrimary: Colors.white,
                      minimumSize: Size(170.0, 40.0)),
                  onPressed: () {
                    setState(() {
                      if (isEnable) {
                        followCount++;
                        isEnable = false;
                        follow = "Request";
                      } else {
                        --followCount;
                        isEnable = true;
                        follow = "Follow";
                      }
                    });
                  },
                  child: Text(follow))
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
