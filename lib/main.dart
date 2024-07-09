import 'package:flutter/material.dart';
import 'package:footwear_app/profile.dart';
import 'package:footwear_app/track_payment.dart'; // Import TrackPaymentPage
import 'LoginScreen.dart';
import 'signup_via_aadhar.dart';
import 'signup_manually.dart';
import 'signup_completed.dart';
import 'select_language.dart';
import 'dashboard.dart';
import 'splash_screen.dart';
import 'EditAddCustomerPage.dart';
import 'RaiseTicket.dart';
import 'RewardPage.dart';

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
        fontFamily: 'Montserrat',
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/signupViaAadhar': (context) => SignupViaAadhar(),
        '/signupManually': (context) => SignupManually(),
        '/signupCompleted': (context) => SignupCompleted(),
        '/selectLanguage': (context) => SelectLanguage(),
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => Dashboard(),
        '/profile': (context) => ProfilePage(),
        '/editAddCustomer': (context) => EditAddCustomerPage(),
        '/raiseTicket': (context) => RaiseTicketPage(),
        '/reward': (context) => RewardPage(),
        '/trackpayment': (context) => TrackPaymentPage()
      },
    );
  }
}
