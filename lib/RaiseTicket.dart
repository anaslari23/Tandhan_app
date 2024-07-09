import 'package:flutter/material.dart';

class RaiseTicketPage extends StatefulWidget {
  @override
  _RaiseTicketPageState createState() => _RaiseTicketPageState();
}

class _RaiseTicketPageState extends State<RaiseTicketPage> {
  final _formKey = GlobalKey<FormState>();
  final _issueController = TextEditingController();
  String? _selectedIssue;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission logic here
      print('Submit button clicked');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Raise a Ticket'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildDropdown(),
                SizedBox(height: 20),
                _buildTextArea(),
                SizedBox(height: 20),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: 'Please Select Your Issue',
      ),
      value: _selectedIssue,
      items: ['Cancel My Order', 'Item Unavailable', 'Update KYC']
          .map((issue) => DropdownMenuItem(
        child: Text(issue),
        value: issue,
      ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedIssue = value;
        });
      },
      validator: (value) => value == null ? 'Please select an issue' : null,
    );
  }

  Widget _buildTextArea() {
    return TextFormField(
      controller: _issueController,
      maxLines: 5,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: 'Please State Your Issue And Press Submit',
      ),
      validator: (value) =>
      value == null || value.isEmpty ? 'Please state your issue' : null,
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _submit,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green, // Text color changes based on form validity
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: Text('Submit', style: TextStyle(fontSize: 16)),
    );
  }
}
