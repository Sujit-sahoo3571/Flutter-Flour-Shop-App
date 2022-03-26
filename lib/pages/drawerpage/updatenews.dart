import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/fontstyles/textstyles.dart';

class UpdateNews extends StatelessWidget {
  const UpdateNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update News")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              MyFonts(
                text: "NO New Updates are Availible for Now !",
                color: Colors.red,
                size: 22.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
