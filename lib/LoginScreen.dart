import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'signup_via_aadhar.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? language = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Text(
                language == 'English' ? 'WELCOME' : 'स्वागत है', // Example for Hindi
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              // Username Text Field
              TextField(
                onChanged: (value) {
                  // Check if the fields are not empty to enable the button
                  // You can add more checks if necessary
                  if (value.isNotEmpty) {
                    // Enable the button
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: language == 'English' ? 'Username' : 'उपयोगकर्ता नाम', // Example for Hindi
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Password Text Field
              TextField(
                obscureText: true,
                onChanged: (value) {
                  // Check if the fields are not empty to enable the button
                  // You can add more checks if necessary
                  if (value.isNotEmpty) {
                    // Enable the button
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: language == 'English' ? 'Password' : 'पासवर्ड', // Example for Hindi
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // Login Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(
                  language == 'English' ? 'Log In' : 'लॉग इन करें', // Example for Hindi
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 15),
              // "New User? Sign Up" Text
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupViaAadhar()),
                  );
                },
                child: Text(
                  language == 'English' ? 'New User? Sign Up' : 'नया उपयोगकर्ता? साइन अप करें', // Example for Hindi
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
