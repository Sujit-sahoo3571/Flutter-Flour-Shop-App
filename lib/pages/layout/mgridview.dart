import 'package:flutter/material.dart';
import '../../fontstyles/textstyles.dart';

class MyGrid extends StatelessWidget {
  const MyGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 2.0,
      children: [
        buildCard("Turmeric(ହଳଦି) Powder", "Available", 1), // haldi
        buildCard("cumin(ଜିରା)", "Not Available", 2), // jeera
        buildCard("Coriander(ଧଣିଆ)", "Available", 3), // dhanie
        buildCard("Mustard(ସୋରିଷ)", "Not Available", 4), // sarso
        buildCard("Flour(ଆଟା)", "Available", 5), //atta
        buildCard("Chilly(ଲଙ୍କା) Powder", "Available", 6), // lanka
        buildCard("Besana(ବେସନ)", "Not Available", 7), // besana
        buildCard("Finger millet(ମାଣ୍ଡିଆ)", "Available", 8), //mandia
        buildCard("GaramMasala(ଗରମ ମସଲା)", "Not Available", 9), //garam masala
        buildCard("Chatua(ଛତୁଆ)", "Available", 10), // CHATUA
        buildCard("cumin(ଜିରା) Powder", "Available", 11), // jeera
        buildCard("Mustard Oil(ସୋରିଷ ତେଲ)", "Available", 12), // sarso tel
        buildCard("Chatua(ସାଧା ଛତୁଆ)", "Available", 13), // CHATUA
      ],
    );
  }

  //build the cards
  Widget buildCard(String name, String status, int cardIndex) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 7.0,
      child: Column(
        children: [
          SizedBox(
            height: 12.0,
          ),
          Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(30.0),
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1524250502761-1ac6f2e30d43?ixid=MnwzMDU2NzR8MHwxfHNlYXJjaHwyfHx3b21hbnxlbnwwfHx8fDE2NDU5MzgwNzE&ixlib=rb-1.2.1'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          MyFonts(
            text: name,
          ),
          SizedBox(
            height: 10.0,
          ),
          MyFonts(
            text: status,
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Container(
              width: 175.0,
              decoration: BoxDecoration(
                  // available
                  color: status == "Not Available" ? Colors.grey : Colors.green,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0))),
              child: Center(
                child: MyFonts(
                  text: "Request",
                  // status == "Available" ? "Available" : "Currently Stock-out",
                  // color: status == "Available"
                  //     ? Colors.black
                  //     : Color.fromARGB(255, 139, 40, 32),
                ),
              ),
            ),
          ),
          // SizedBox(height: 10.0,)
        ],
      ),
      margin: cardIndex.isEven
          ? EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0)
          : EdgeInsets.fromLTRB(25.0, 0.0, 5.0, 10.0),
    );
  }

   ListView gridviewscreen() {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          height: 60.0,
          child: MyFonts(text: "BUY MORE", color: Colors.green, size: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          padding: EdgeInsets.only(left: 25.0, right: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyFonts(
                text: "Categories",
              ),
              MyFonts(
                text: "See All",
                color: Colors.blue,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        MyGrid(),
      ],
    );
  }
}
