import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:footwear_app/signup_completed.dart';
import 'loginScreen.dart';

class SignupManually extends StatefulWidget {
  @override
  _SignupManuallyState createState() => _SignupManuallyState();
}

class _SignupManuallyState extends State<SignupManually> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _whatsappController = TextEditingController();
  final _emailController = TextEditingController();
  final _aadharController = TextEditingController();
  bool isSameAsContact = true;

  bool get _isFormValid =>
      _nameController.text.isNotEmpty &&
          _contactController.text.length == 10 &&
          _whatsappController.text.length == 10 &&
          _emailController.text.contains('.com') &&
          _aadharController.text.length == 12;

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Handle form submission logic here
      print('Submit button clicked');
      Navigator.pushNamed(context, '/signupCompleted');
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updateButtonState);
    _contactController.addListener(_updateButtonState);
    _whatsappController.addListener(_updateButtonState);
    _emailController.addListener(_updateButtonState);
    _aadharController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _whatsappController.dispose();
    _emailController.dispose();
    _aadharController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {});
  }

  void _navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
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
                _buildTextField('Name', _nameController),
                _buildTextField('Contact No.', _contactController, isPhoneNumber: true),
                _buildTextField('WhatsApp No.', _whatsappController, isPhoneNumber: true),
                _buildCheckbox(),
                _buildTextField('E-Mail', _emailController, isEmail: true),
                _buildTextField('Aadhar No.', _aadharController, isAadhar: true),
                SizedBox(height: 20),
                _buildSubmitButton(context),
                SizedBox(height: 20),
                _buildLoginText(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller, {bool isPhoneNumber = false, bool isEmail = false, bool isAadhar = false}) {
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
        keyboardType: isPhoneNumber || isAadhar ? TextInputType.number : TextInputType.text,
        maxLength: isPhoneNumber || isAadhar ? (isAadhar ? 12 : 10) : null,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $hint';
          }
          if (isPhoneNumber && value.length != 10) {
            return 'Please enter a valid 10-digit $hint';
          }
          if (isAadhar && value.length != 12) {
            return 'Please enter a valid 12-digit $hint';
          }
          if (isEmail && !value.contains('.com')) {
            return 'Please enter a valid email address';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildCheckbox() {
    return CheckboxListTile(
      title: Text("Same as Contact No."),
      value: isSameAsContact,
      onChanged: (newValue) {
        setState(() {
          isSameAsContact = newValue!;
          if (isSameAsContact) {
            _whatsappController.text = _contactController.text;
          } else {
            _whatsappController.clear();
          }
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.green,
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
    home: SignupManually(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    routes: {
      '/signupCompleted': (context) => SignupCompleted(),
    },
  ));
}
