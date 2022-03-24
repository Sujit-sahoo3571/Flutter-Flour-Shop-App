import 'package:flutter/material.dart';

class UpdateNews extends StatelessWidget {
  const UpdateNews({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update News")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
            
              child: Text("NO New Update Availible for Now !"),
            )
          ],
          
        ),
      ),
    );
  }
}