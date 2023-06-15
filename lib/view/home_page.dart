import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intern_task1/utils/utils.dart';
import 'package:intern_task1/view/login/login_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
          backgroundColor: Color(0xffE43228),
          actions: [
            IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });
              },
              icon: Icon(Icons.logout),
            ),
            SizedBox(
              width: 10,
            ),
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Home Page'),
          ),
        ],
      ),
    );
  }
}
