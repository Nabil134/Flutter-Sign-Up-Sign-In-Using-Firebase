import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intern_task1/view/sign%20up/sign_up.dart';
import 'package:intern_task1/view/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffE43228),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color(0xffE43228),
          contentTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
