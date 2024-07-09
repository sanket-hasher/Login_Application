import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_application/pages/home.dart';
import 'package:login_application/pages/login.dart';
import 'package:login_application/pages/sign_in.dart';
import 'package:login_application/services/database.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool _obscuretext = true;
  TextEditingController username = new TextEditingController();
  TextEditingController newpassword = new TextEditingController();
  TextEditingController confirmnewpassword = new TextEditingController();
  bool isValidPassword(String password) {
    // Regular expression to check for at least one number
    RegExp numberRegExp = RegExp(r'[0-9]');
    // Regular expression to check for at least one special character
    RegExp specialCharRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    // Regular expression to check for at least one uppercase letter
    RegExp uppercaseRegExp = RegExp(r'[A-Z]');

    if (password.length >= 8 &&
        numberRegExp.hasMatch(password) &&
        specialCharRegExp.hasMatch(password) &&
        uppercaseRegExp.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Center(
                child: Container(
                    padding: EdgeInsets.all(12),
                    height: 450,
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
                                hintText: "Enter your username",
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
                                "New Password",
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
                                    controller: newpassword,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter new password",
                                    ),
                                  ),
                                ),
                                  IconButton(
                                icon: Icon(
                                  _obscuretext ? Icons.visibility : Icons.visibility_off,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Confirm Password",
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
                                    controller: confirmnewpassword,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Re Enter new password",
                                    ),
                                  ),
                                ),
                                  IconButton(
            icon: Icon(
              _obscuretext ? Icons.visibility : Icons.visibility_off,
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
                                  if (newpassword.text !=
                                          confirmnewpassword.text ||
                                      isValidPassword(newpassword.text) ==
                                          false) {
                                    Fluttertoast.showToast(
                                      msg: " Enter Password Again Correctly ",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 6,
                                      backgroundColor:
                                          Color.fromARGB(255, 212, 118, 30),
                                      textColor:
                                          Color.fromARGB(255, 253, 253, 253),
                                      fontSize: 16.0,
                                    );
                                  } else {
                                    await DatabaseMethods()
                                        .updatePasswordByUsername(username.text,
                                            confirmnewpassword.text);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()));
                                  }
                                },
                                child: Text(
                                  'Confirm',
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
                          )
                        ]))),
          ),
        ));
  }
}
