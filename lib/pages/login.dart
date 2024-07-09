import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_application/pages/home.dart';
import 'package:login_application/pages/number_verification.dart';
import 'package:login_application/pages/sign_in.dart';
import 'package:login_application/services/database.dart';
import 'package:login_application/services/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _authService = AuthService();
  bool _obscuretext = true;
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/image.png',
              width: 45,
              height: 45,
            ),
            Text("Please Login",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 216, 116, 208)))
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(12),
                  height: 380,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 241, 215, 241),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Username",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: TextField(
                          controller: username,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Username",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                obscureText: _obscuretext,
                                controller: password,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                _obscuretext
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscuretext = !_obscuretext;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ElevatedButton(
                            onPressed: () async {
                              //_onclickLogin(username.text, password.text);
                              bool isvalid = await DatabaseMethods()
                                  .checkUsernameAndPassword(
                                      username.text, password.text);
                              if (isvalid == true) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                              } else {
                                Fluttertoast.showToast(
                                  msg:
                                      "Login Unsuccessful Password \n or Username Mismatch ",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      Color.fromARGB(255, 177, 43, 10),
                                  textColor: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16.0,
                                );
                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlueAccent,
                              foregroundColor:
                                  Color.fromARGB(255, 201, 201, 201),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            )),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Number_verification()));
                          },
                          child: Text(
                            "Forgot Password ? ",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "New here  ? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  child: Container(
                      height: 56,
                      width: 250,
                      padding: EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.horizontal(),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/google.png',
                            height: 25,
                            width: 30,
                          ),
                          SizedBox(width: 10),
                          Text("Sign In with Google",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))
                        ],
                      )),
                  onTap: () async {
                    User? user = await _authService.signInWithGoogle();
                    if (user != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    }
                     else {
                      print(" User not found ");
                      // Fluttertoast.showToast(
                      //             msg: "USer Not Found",
                      //             toastLength: Toast.LENGTH_SHORT,
                      //             gravity: ToastGravity.CENTER,
                      //             timeInSecForIosWeb: 1,
                      //             backgroundColor:
                      //                 Color.fromARGB(255, 216, 224, 103),
                      //             textColor: Color.fromARGB(255, 248, 133, 40),
                      //             fontSize: 16.0);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> _onclickLogin(String username, String password) async {
  //   bool isValid =
  //       await DatabaseMethods().checkUsernameAndPassword(username, password);

  //   if (isValid) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => Home()),
  //     );
  //   } else {
  //     Fluttertoast.showToast(
  //       msg: "Login Unsuccessful: Password or Username Mismatch",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Color.fromARGB(255, 97, 240, 161),
  //       textColor: Color.fromARGB(255, 20, 16, 16),
  //       fontSize: 16.0,
  //     );
  //   }
  // }
}
