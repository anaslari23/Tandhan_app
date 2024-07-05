import 'package:flutter/material.dart';

class SignupManually extends StatefulWidget {
  @override
  _SignupManuallyState createState() => _SignupManuallyState();
}

class _SignupManuallyState extends State<SignupManually> {
  final _formKey = GlobalKey<FormState>();

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Handle form submission logic here
      print('Submit button clicked');
      Navigator.pushNamed(context, '/signupCompleted');
    }
  }

  void _skip(BuildContext context) {
    Navigator.pushNamed(context, '/signupCompleted');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Your form fields here
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Contact No.'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your contact number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'WhatsApp No.'),
                ),
                CheckboxListTile(
                  title: Text("Same as Contact No."),
                  value: true,
                  onChanged: (newValue) {},
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-Mail'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Aadhar No.'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Aadhar number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _submit(context),
                      child: Text('Submit'),
                    ),
                    ElevatedButton(
                      onPressed: () => _skip(context),
                      child: Text('Skip'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
