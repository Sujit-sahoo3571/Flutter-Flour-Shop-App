import 'package:flutter/material.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ORDERS"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("No Orders Till Now"),
          ],
        ),
      ),
      
    );
  }
}