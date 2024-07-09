import 'package:flutter/material.dart';
import 'dart:async';

class DetailScreen extends StatefulWidget {
  final String productName;
  final String productID;
  final String productImage; // New field for product image

  const DetailScreen({
    Key? key,
    required this.productName,
    required this.productID,
    required this.productImage, // Constructor argument for product image
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String? selectedCustomerName;
  String? selectedBusinessName;
  String? selectedAddress;
  String? selectedGSM;
  String? selectedSize;
  String? selectedUnit;

  // Sample data for dropdown menus (replace with your actual data)
  final List<String> customerNames = ['John Doe', 'Jane Smith'];
  final List<String> businessNames = ['Acme Corp', 'Globex Inc.'];
  final List<String> addresses = ['123 Main St', '456 Elm St'];
  final List<String> gsms = ['100', '150'];
  final List<String> sizes = ['Small', 'Medium', 'Large'];
  final List<String> units = ['pcs', 'm2'];

  bool get isAllSelected =>
      selectedCustomerName != null &&
          selectedBusinessName != null &&
          selectedAddress != null &&
          selectedGSM != null &&
          selectedSize != null &&
          selectedUnit != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productName),
        backgroundColor: Colors.blue, // Adjust app bar color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200, // Adjust height as needed
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.productImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    widget.productName,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.productID,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  _buildDropdown('Customer Name', customerNames, selectedCustomerName),
                  SizedBox(height: 10),
                  _buildDropdown('Business Name', businessNames, selectedBusinessName),
                  SizedBox(height: 10),
                  _buildDropdown('Address', addresses, selectedAddress),
                  SizedBox(height: 10),
                  _buildDropdown('GSM', gsms, selectedGSM),
                  SizedBox(height: 10),
                  _buildDropdown('Size', sizes, selectedSize),
                  SizedBox(height: 10),
                  _buildDropdown('Quantity', units, selectedUnit),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ChoiceChip(
                        label: Text('Available'),
                        selected: isAllSelected,
                        selectedColor: Colors.green,
                        backgroundColor: isAllSelected ? Colors.green : Colors.grey[300],
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      ChoiceChip(
                        label: Text('Unavailable'),
                        selected: !isAllSelected,
                        selectedColor: Colors.red,
                        backgroundColor: !isAllSelected ? Colors.red : Colors.grey[300],
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isAllSelected ? _showOrderPlacedDialog : null,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? selectedValue) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      value: selectedValue,
      onChanged: (newValue) {
        setState(() {
          switch (label) {
            case 'Customer Name':
              selectedCustomerName = newValue;
              break;
            case 'Business Name':
              selectedBusinessName = newValue;
              break;
            case 'Address':
              selectedAddress = newValue;
              break;
            case 'GSM':
              selectedGSM = newValue;
              break;
            case 'Size':
              selectedSize = newValue;
              break;
            case 'Quantity':
              selectedUnit = newValue;
              break;
          }
        });
      },
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }

  void _showOrderPlacedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Expanded(child: Text("Your order is placed")),
            ],
          ),
        );
      },
    );

    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pop(); // Close the dialog
      Navigator.of(context).pop(); // Navigate back to the previous screen
    });
  }
}
