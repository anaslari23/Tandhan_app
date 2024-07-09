import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  DateTime? _fromDate;
  DateTime? _toDate;
  String _selectedFilter = "CUSTOM";

  final List<Map<String, String>> transactions = [
    {
      "date": "10 may",
      "transactionId": "# Transaction Id",
      "reward": "Reward -21",
      "amount": "21000"
    },
    {
      "date": "10 may",
      "transactionId": "# Transaction Id",
      "reward": "Reward -21",
      "amount": "21000"
    },
    {
      "date": "10 may",
      "transactionId": "# Transaction Id",
      "reward": "Reward -21",
      "amount": "21000"
    },
  ];

  Future<void> _selectDate(BuildContext context, bool isFrom) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isFrom ? _fromDate : _toDate)) {
      setState(() {
        if (isFrom) {
          _fromDate = picked;
        } else {
          _toDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'TM Wallet',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterButton("LAST 10"),
                _buildFilterButton("LAST  WEEK"),
                _buildFilterButton("LAST MONTH"),
                _buildFilterButton("CUSTOM"),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDatePicker("From", true),
                _buildDatePicker("To", false),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Download",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Tandhan Balance 147pts",
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Column(
              children: transactions.map((transaction) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        transaction['date']!,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    title: Text(transaction['transactionId']!),
                    subtitle: Text(transaction['reward']!),
                    trailing: Text(
                      transaction['amount']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle reward button press
                  // Navigate to reward page or perform reward action
                },
                child: Text(
                  "Rewards",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String label) {
    bool isSelected = _selectedFilter == label;
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _selectedFilter = label;
            });
          },
          child: Text(label, style: TextStyle(fontSize: 14), textAlign: TextAlign.center), // Adjust font size and center the text
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12),
            backgroundColor: isSelected ? Colors.black : Colors.white,
            foregroundColor: isSelected ? Colors.white : Colors.black,
            side: BorderSide(color: Colors.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker(String label, bool isFrom) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        child: ElevatedButton(
          onPressed: () => _selectDate(context, isFrom),
          child: Text(
            label == "From"
                ? (_fromDate != null ? DateFormat('dd MMM').format(_fromDate!) : label)
                : (_toDate != null ? DateFormat('dd MMM').format(_toDate!) : label),
            style: TextStyle(fontSize: 14), textAlign: TextAlign.center, // Adjust font size and center the text
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            side: BorderSide(color: Colors.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WalletPage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: 'Montserrat',
    ),
  ));
}
