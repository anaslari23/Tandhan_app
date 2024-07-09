import 'package:flutter/material.dart';

class EditAddCustomerPage extends StatefulWidget {
  @override
  _EditAddCustomerPageState createState() => _EditAddCustomerPageState();
}

class _EditAddCustomerPageState extends State<EditAddCustomerPage> {
  bool? isEditMode = false;

  void _toggleMode(bool? isEdit) {
    setState(() {
      isEditMode = isEdit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD/EDIT CUSTOMERS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Add'),
                Radio(
                  value: false,
                  groupValue: isEditMode,
                  onChanged: _toggleMode,
                ),
                SizedBox(width: 20),
                Text('Edit'),
                Radio(
                  value: true,
                  groupValue: isEditMode,
                  onChanged: _toggleMode,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              isEditMode == true ? 'Edit Customer' : 'Add Customer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            if (isEditMode == true)
              DropdownButtonFormField<String>(
                hint: Text('Select'),
                items: <String>['Customer 1', 'Customer 2', 'Customer 3']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            SizedBox(height: 20),
            _buildTextField('Company Name'),
            _buildTextField('Customer Name'),
            _buildTextField('Contact Number'),
            _buildTextField('Address'),
            _buildTextField('Pin Code'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text('SUBMIT'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
