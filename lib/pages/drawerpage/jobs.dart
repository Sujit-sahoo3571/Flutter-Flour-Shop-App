import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';
import 'package:url_launcher/url_launcher.dart';

class JobPortals extends StatelessWidget {
  JobPortals({Key? key}) : super(key: key);
  final _sizedbox = SizedBox(
    height: 10.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jobs Portal"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              MyFonts(
                text:
                    "Yes!, We're Hiring Now !! ,\nNew Jobs will be updated Soon!!",
                color: Colors.green,
                bold: true,
                size: 24.0,
              ),
              _sizedbox,
              // _sizedbox,
              // MyFonts(text: "Apply Now : ", color: Colors.green,size: 20.0,),
              // _sizedbox,
              Card(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: MyFonts(
                        text: "Helper/Assistant\n\n"
                            "The BBSR Flour Mills Company Limited\n\n "
                            " Job description \n"
                            "--------------------------\n"
                            "Help in Packages and Distribute the Products.\n"
                            " Maintain Good Manners to the customers.\n"
                            " Handling multiple Request For the Products.\n"
                            " Inform the Sell records and maintain it properly.\n\n"
                            "Apply for Job Link(here) Below"),
                  ),
                  InkWell(
                    onTap: () {
                      _ontap();
                      // https://forms.gle/zQPB9Fcnv3F84tKh8
                    },
                    child: MyFonts(
                      text: "here ",
                      size: 20.0,
                      color: Colors.blue,
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  // void _ontap() {}
  void _ontap() async {
    const url = "https://forms.gle/zQPB9Fcnv3F84tKh8";
    try {
      if (await canLaunch(url))
        launch(url);
      else
        throw 'could not launch $url';
    } catch (e) {
      print(e.toString());
    }
  }
}
