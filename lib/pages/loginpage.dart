import 'package:flutter/material.dart';
import 'package:flutter_flour_shop/services/authservice.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String email = '', password = '';
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
        title: Text("LogIn page"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: formKey,
          child: _buildLoginForm(),
        ),
      ),
    );
  }

  _buildLoginForm() {
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
                  "Hello",
                  style: TextStyle(
                    fontFamily: "Truneo",
                    fontSize: 60.0,
                  ),
                ),
                Positioned(
                    top: 55.0,
                    child: Text(
                      "There",
                      style: TextStyle(
                        fontFamily: "Truneo",
                        fontSize: 60.0,
                      ),
                    )),
                Positioned(
                    top: 114.0,
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
          TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              labelStyle: TextStyle(
                fontFamily: "Truneo",
                fontSize: 12.0,
                color: Colors.grey.withOpacity(0.5),
              ),
              focusedBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: green)),
            ),
            obscureText: true,
            onChanged: (value) => this.password = value,
            validator: (value) =>
                value!.isEmpty ? 'Password is required ' : null,
          ),
          SizedBox(
            height: 5.0,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment(1.0, 0.0),
              padding: EdgeInsets.only(top: 15.0, left: 20.0),
              child: InkWell(
                child: Text(
                  "Forget Password",
                  style: TextStyle(
                      fontFamily: "Truneno",
                      fontSize: 12.0,
                      decoration: TextDecoration.underline,
                      color: green),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          GestureDetector(
            onTap: () {
              if(checkField())
              AuthServices().signIn(email, password, context);
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
                    "LOGIN",
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
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  // Center(
                  //   child: ImageIcon(
                  //     AssetImage('assets/images/google.png'),
                  //     size: 15.0,

                  //   ),
                  // ),//  image blacked
                  SizedBox(
                    width: 10.0,
                  ),
                  Center(
                    child: Text(
                      "Login with Google",
                      style: TextStyle(
                        fontFamily: "Trueno",
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("New To Flour Shop ? "),
              SizedBox(
                width: 10.0,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: green,
                    fontFamily: "Trueno",
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
