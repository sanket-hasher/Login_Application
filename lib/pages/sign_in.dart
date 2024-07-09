import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_application/services/database.dart';
import 'package:random_string/random_string.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController name = new TextEditingController();
  TextEditingController phonenumber = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();
  bool _obscuretext = true;
  int checkPhone(String ph) {
    if (ph.length != 10) {
      return 0;
    } else
      return 1;
  }

  bool isValidPassword(String password) {
    // Regular expression to check for at least one number
    RegExp numberRegExp = RegExp(r'[0-9]');
    // Regular expression to check for at least one special character
    RegExp specialCharRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    // Regular expression to check for at least one uppercase letter
    RegExp uppercaseRegExp = RegExp(r'[A-Z]');

    if (password.length > 8 &&
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/image.png',
                width: 45,
                height: 45,
              ),
              Text(" SIGN IN ",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 216, 116, 208)))
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(12),
              height: 750,
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
                        "Name",
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
                      controller: name,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Your Full Name",
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
                        "Phone Number ",
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
                      controller: phonenumber,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your Phone Number",
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
                              hintText: "Enter Your Password",
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
                        "Confirm Your Password",
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
                            obscureText: true,
                            controller: confirmpassword,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Re-enter Your Password",
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
                          String sample = "Abc_256";
                          if (checkPhone(phonenumber.text) == 0) {
                            Fluttertoast.showToast(
                              msg:
                                  "Enter correct phone number Must be of Length 10 sample : 9876543210",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 8,
                              backgroundColor:
                                  Color.fromARGB(255, 167, 223, 255),
                              textColor: const Color.fromARGB(255, 31, 8, 8),
                              fontSize: 16.0,
                            );
                          } else if (isValidPassword(password.text) == false) {
                            Fluttertoast.showToast(
                              msg:
                                  "Password less than 8 characters sample \n Must contain one Uppercase \n Must have a Special Character \n Must have a Digit \n : ${sample}",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 12,
                              backgroundColor:
                                  Color.fromARGB(255, 167, 223, 255),
                              textColor: const Color.fromARGB(255, 31, 8, 8),
                              fontSize: 16.0,
                            );
                          } else if (password.text != confirmpassword.text) {
                            Fluttertoast.showToast(
                              msg: "Passwords do not match",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          } else {
                            String id = randomNumeric(2);
                            Map<String, dynamic> UserInfoMap = {
                              "Name": name.text,
                              "Phone Number": phonenumber.text,
                              "Id": id,
                              "Username": username.text,
                              "Password": password.text
                            };
                            await DatabaseMethods()
                                .addUserDetails(UserInfoMap, id)
                                .then((value) {
                              Fluttertoast.showToast(
                                  msg: "Added Successfully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      Color.fromARGB(255, 216, 224, 103),
                                  textColor: Color.fromARGB(255, 248, 133, 40),
                                  fontSize: 16.0);
                            });
                          }
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                          foregroundColor: Color.fromARGB(255, 201, 201, 201),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
