import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/services/authservice.dart';
import 'package:flutter_flour_shop/services/error_handler.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({Key? key}) : super(key: key);

  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final formKey = new GlobalKey<FormState>();

  String email = '';
  Color green = Color(0xFF00AF19);

//validate email
  String? validateEmail(String? value) {
    // Pattern pattern =
    //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regex.hasMatch(value!))
      return "Enter valid Email ";
    else
      null;
  }

  // To check field during submit
  checkField() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset page"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: formKey,
          child: _buildResetForm(),
        ),
      ),
    );
  }

  _buildResetForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: ListView(
        children: [
          SizedBox(
            height: 75.0,
          ),
          Container(
            height: 125.0,
            width: 200.0,
            child: Stack(
              children: [
                Text(
                  "Reset",
                  style: TextStyle(
                    fontFamily: "Truneo",
                    fontSize: 60.0,
                  ),
                ),
                Positioned(
                    top: 58.0,
                    left: 189.0,
                    child: Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: green,
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 35.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(
                fontFamily: "Truneo",
                fontSize: 12.0,
                color: Colors.grey.withOpacity(0.5),
              ),
              focusedBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: green)),
            ),
            onChanged: (value) => this.email = value,
            validator: (value) =>
                value!.isEmpty ? 'Email is required ' : validateEmail(value),
          ),
          SizedBox(
            height: 50.0,
          ),
          GestureDetector(
            onTap: () {
              if (checkField()) AuthServices().reset(email);
              Navigator.of(context).pop();
            },
            child: Container(
              height: 50.0,
              child: Material(
                borderRadius: BorderRadius.circular(25.0),
                shadowColor: Colors.greenAccent,
                color: green,
                elevation: 7.0,
                child: Center(
                  child: Text(
                    "Reset",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Trueno",
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Center(
              child: Text(
                "Go Back",
                style: TextStyle(
                  color: green,
                  fontFamily: "Trueno",
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
