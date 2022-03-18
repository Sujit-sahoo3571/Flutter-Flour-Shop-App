import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';

class PurchaseDetails extends StatelessWidget {
  const PurchaseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Purchase Details"), centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Container(
            margin: EdgeInsets.all(10.0),
            height: 40.0,
            width: MediaQuery.of(context).size.width * .94,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.green, Colors.orange]),
            ),
            child: Center(
                child: MyFonts(
              text: "ORDER HISTORY ",
              bold: true,
              color: Colors.white,
            )),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            width: MediaQuery.of(context).size.width* 0.90,
            height: MediaQuery.of(context).size.height* 0.70,
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.blue),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(120.0, 40.0),
              onPrimary: Colors.white,
              primary: Colors.yellow,
              padding: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              )
            ),
            onPressed: (){}, child: Text("CLEAR"))
          ],
        ),
      ),
    );
  }
}
