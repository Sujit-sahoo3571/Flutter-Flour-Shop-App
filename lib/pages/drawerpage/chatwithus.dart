import 'package:flutter/material.dart';

class ChatWithUs extends StatelessWidget {
  const ChatWithUs({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: Column(
        children: [
          Text("Welcome to Chat Room !")
        ],
      ),
      
    );
  }
}