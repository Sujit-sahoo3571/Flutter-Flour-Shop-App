import 'package:flutter/material.dart';

class JobPortals extends StatelessWidget {
  const JobPortals({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jobs Portal"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          Card(
            child: Text("Yes!, We're Hiring Now !! , Jobs will be updated Soon"))
          ],
          
        ),
      ),
    );
  }
}