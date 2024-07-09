import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_application/pages/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor:Colors.white,
      title: Row(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/image.png',
            width: 45,
            height: 45,
          ),
          SizedBox(width: 30),
          Text("HOME",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 60, 216, 40))),
          SizedBox(width: 54),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Image.asset(
                'assets/images/logout_icon.png',
                width: 60,
                height: 80,
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          )
        ],
      ),
    ));
  }
}
