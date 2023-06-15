import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intern_task1/view/login/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*first portion start here*/
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                height: size.height * 0.2,
                width: size.width * 0.2,
                image: AssetImage('assets/images/image.png'),
              ),
            ],
          ),
          /*first portion end here*/
          Text(
            'Lorem',
            style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey),
          ),
          Text(
            'IPSUM',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey),
          ),
        ],
      ),
    ));
  }
}
