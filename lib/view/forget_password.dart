import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intern_task1/utils/utils.dart';
import 'package:intern_task1/view/sign%20up/components/custom_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE43228),
        title: Text('Forget Password'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*first portion start here*/
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              /*first portion end here*/
              SizedBox(
                height: 40,
              ),
              /*second portion start here*/
              CustomButton(
                  handleButtonClick: () {
                    auth
                        .sendPasswordResetEmail(
                            email: emailController.text.toString())
                        .then((value) {
                      Utils().toastMessage(
                          'We have sent you email to recover password, please check email');
                    }).onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                  },
                  txt: "Forgot"),
              /*second portion end here*/
            ]),
      ),
    );
  }
}
