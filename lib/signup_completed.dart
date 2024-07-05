import 'package:flutter/material.dart';

class SignupCompleted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Your success message here
            Icon(
              Icons.check_circle_outline,
              size: 100.0,
              color: Colors.grey,
            ),
            SizedBox(height: 20),
            Text(
              'Sign up completed',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              'We will contact you within 48hrs',
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/selectLanguage');
              },
              child: Text('Select Language'),
            ),
          ],
        ),
      ),
    );
  }
}
