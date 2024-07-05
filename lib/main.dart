import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'signup_via_aadhar.dart';
import 'signup_manually.dart';
import 'signup_completed.dart';
import 'select_language.dart';
import 'dashboard.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/signupViaAadhar': (context) => SignupViaAadhar(), // Corrected route name
        '/signupManually': (context) => SignupManually(),
        '/signupCompleted': (context) => SignupCompleted(),
        '/selectLanguage': (context) => SelectLanguage(),
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}
