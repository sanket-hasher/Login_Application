import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_application/pages/home.dart';
import 'package:login_application/pages/new_password.dart';
import 'package:login_application/pages/sign_in.dart';
import 'package:login_application/services/database.dart';

class Number_verification extends StatefulWidget {
  const Number_verification({super.key});

  @override
  State<Number_verification> createState() => _Number_verificationState();
}

class _Number_verificationState extends State<Number_verification> {
  TextEditingController name = new TextEditingController();
  TextEditingController phonenumber = new TextEditingController();
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
                                hintText: "Enter your Full Name",
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
                                "Phone Number",
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
                                hintText: "Enter Full Phone Number",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: ElevatedButton(
                                onPressed: () async {
                                  bool isvalid = await DatabaseMethods()
                                      .checkNameAndPhoneNumber(
                                          name.text, phonenumber.text);
                                    if (isvalid == true) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NewPassword()));
                              } else {
                                Fluttertoast.showToast(
                                  msg:
                                      " Name or Phone Number \n Mismatch ",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 6,
                                  backgroundColor:
                                      Color.fromARGB(255, 192, 47, 22),
                                  textColor: Color.fromARGB(255, 241, 241, 243),
                                  fontSize: 16.0,
                                );
                              }      
                                },
                                child: Text(
                                  'Check',
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
