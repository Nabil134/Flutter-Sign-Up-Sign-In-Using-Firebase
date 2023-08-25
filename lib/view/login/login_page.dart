import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intern_task1/view/forget_password.dart';
import 'package:intern_task1/view/home_page.dart';
import 'package:intern_task1/view/login/components/custom_button.dart';
import 'package:intern_task1/view/login/components/userid_text_field.dart';
import 'package:intern_task1/view/sign%20up/sign_up.dart';

import 'components/password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);
  bool loading = false;
  /*validation function start here */
  void validation() {
    if (email.text.isEmpty && password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("All Field is Empty"),
      ));
    }
    if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Email is Empty"),
      ));
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Email is Not Valid"),
      ));
    } else if (password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password is Empty"),
      ));
    } else if (password.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password is Too Short "),
      ));
    } else {
      submit();
    }
  }

  /*validation function end here */
  //late auth = FirebaseAuth.instance;
  late UserCredential auth;
  /* submit function start here */
  void submit() async {
    setState(() {
      loading = true;
    });
    try {
      auth = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => HomePage({
            'email': email.text,
            'password': password.text,
          }),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String message = "Please Check Internet";
      if (e.message != null) {
        message = e.message.toString();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message.toString()),
        ),
      );
      setState(() {
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }

    setState(() {
      loading = false;
    });
  }

  /* submit function end here */
  final TextEditingController password = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

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
            SizedBox(
              height: size.height * 0.02,
            ),
            /*second portion start here*/
            Text(
              "Sign In",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            /*second portion end here*/
            SizedBox(
              height: size.height * 0.02,
            ),
            /*third portion start here*/
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: UserIdTextField(
                  controller: email,
                  userIdHintText: "Email",
                  userIdHintTextColor: Colors.grey),
            ),
            /*third portion end here*/
            SizedBox(
              height: size.height * 0.02,
            ),
            /*forth portion start here*/
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: UserPasswordTextField(
                controller: password,
                userpassHintText: "Password",
                userpassHintTextColor: Colors.grey,
                userPassTextFieldsuffixIcon: Icons.visibility,
                userPassTextFieldsuffixIconColor: Colors.black,
              ),
            ),
            /*forth portion end here*/
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomButton(
                handleButtonClick: () {
                  validation();
                },
                txt: "Login"),
            SizedBox(
              height: size.height * 0.02,
            ),
            /*
            CustomButton(
                handleButtonClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgetPasswordScreen()),
                  );
                },
                txt: 'Forgot Password?'),
           */
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPasswordScreen()));
                  },
                  child: Text('Forgot Password?')),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            /*Last Portion start here*/

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t Have an account?',
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: Text(
                    ' Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xffE43228),
                    ),
                  ),
                ),
              ],
            ),
            /*Last Portion end here*/
          ],
        ),
      ),
    );
  }
}
