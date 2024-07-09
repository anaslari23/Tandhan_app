import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:footwear_app/signup_manually.dart';
import 'package:footwear_app/signup_completed.dart';
import 'package:footwear_app/select_language.dart';

class SignupViaAadhar extends StatefulWidget {
  @override
  _SignupViaAadharState createState() => _SignupViaAadharState();
}

class _SignupViaAadharState extends State<SignupViaAadhar> {
  final _formKey = GlobalKey<FormState>();
  final _aadharController = TextEditingController();
  final _otpController = TextEditingController();
  final _whatsappController = TextEditingController();

  bool get _isFormValid =>
      _aadharController.text.length == 12 &&
          _otpController.text.length == 6 &&
          _whatsappController.text.length == 10;

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Handle form submission logic here
      print('Submit button clicked');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignupCompleted()),
      );
    }
  }

  void _skip(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupCompleted()),
    );
  }

  void _navigateToSignupManually(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupManually()),
    );
  }

  void _navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectLanguage()),
    );
  }

  @override
  void dispose() {
    _aadharController.dispose();
    _otpController.dispose();
    _whatsappController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _buildTextField('Aadhar No.', _aadharController, 12),
                _buildButton('Generate OTP'),
                _buildTextField('Enter OTP', _otpController, 6),
                _buildTextField('WhatsApp No.', _whatsappController, 10),
                SizedBox(height: 20),
                _buildSubmitButton(context),
                SizedBox(height: 20),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'or ',
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'sign up manually',
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              _navigateToSignupManually(context);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _buildLoginText(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller, int maxLength) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide.none,
          ),
        ),
        keyboardType: TextInputType.number,
        maxLength: maxLength,
        onChanged: (value) {
          setState(() {}); // Update the state to reflect the changes
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $hint';
          } else if (value.length != maxLength) {
            return 'Please enter a valid $hint';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.0),
        ),
        child: Text(text, style: TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: _isFormValid ? () => _submit(context) : null,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: _isFormValid ? Colors.blue : Colors.grey, // Text color changes based on form validity
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: Text('Submit', style: TextStyle(fontSize: 16)),
    );
  }

  Widget _buildLoginText(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Already a user? ',
          style: TextStyle(color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: 'Log In',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _navigateToLogin(context);
                },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SignupViaAadhar(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    routes: {
      '/signupCompleted': (context) => SignupCompleted(),
      '/signupManually': (context) => SignupManually(),
      '/selectLanguage': (context) => SelectLanguage(),
    },
  ));
}
