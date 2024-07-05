import 'package:flutter/material.dart';

class EditAddCustomerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit/Add Customer'),
      ),
      body: Center(
        child: Text(
          'Edit/Add Customer Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
