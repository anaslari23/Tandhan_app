import 'package:flutter/material.dart';

class TrackPaymentPage extends StatefulWidget {
  @override
  _TrackPaymentPageState createState() => _TrackPaymentPageState();
}

class _TrackPaymentPageState extends State<TrackPaymentPage> {
  bool isTrack = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Payment'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildToggleButtons(),
            SizedBox(height: 20),
            _buildCompanyNameDropdown(),
            if (isTrack) ...[
              SizedBox(height: 20),
              _buildOrderDetails(),
              SizedBox(height: 20),
              _buildOrderDetails(),
              SizedBox(height: 20),
              _buildOrderDetails(),
            ] else ...[
              SizedBox(height: 20),
              _buildOrderIDDropdown(),
              SizedBox(height: 20),
              _buildInstallmentNumberDropdown(),
              SizedBox(height: 20),
              _buildInstallmentTable(),
              SizedBox(height: 20),
              _buildSaveButton(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip(
          label: Text('New'),
          selected: !isTrack,
          onSelected: (selected) {
            setState(() {
              isTrack = !selected;
            });
          },
        ),
        SizedBox(width: 10),
        ChoiceChip(
          label: Text('Track'),
          selected: isTrack,
          onSelected: (selected) {
            setState(() {
              isTrack = selected;
            });
          },
        ),
      ],
    );
  }

  Widget _buildCompanyNameDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Company Name',
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
      ),
      items: ['Company A', 'Company B', 'Company C']
          .map((company) => DropdownMenuItem(
        value: company,
        child: Text(company),
      ))
          .toList(),
      onChanged: (value) {},
    );
  }

  Widget _buildOrderIDDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Order ID',
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
      ),
      items: ['Order 1', 'Order 2', 'Order 3']
          .map((order) => DropdownMenuItem(
        value: order,
        child: Text(order),
      ))
          .toList(),
      onChanged: (value) {},
    );
  }

  Widget _buildInstallmentNumberDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'No. of Installments',
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
      ),
      items: ['1', '2', '3']
          .map((installments) => DropdownMenuItem(
        value: installments,
        child: Text(installments),
      ))
          .toList(),
      onChanged: (value) {},
    );
  }

  Widget _buildInstallmentTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildInstallmentRow('1', 'May 17 2024', '₹ 20,224', 'Paid'),
        _buildInstallmentRow('2', 'Nov 17 2024', '₹ 18,119', 'Unpaid'),
        _buildInstallmentRow('3', 'May 17 2025', '₹ 16,113', 'Due'),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.grey,
            backgroundColor: Colors.grey[200],
            padding: EdgeInsets.symmetric(vertical: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          child: Text('+ Add Installment', style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  Widget _buildInstallmentRow(String no, String date, String amount, String status) {
    Color statusColor;
    switch (status) {
      case 'Paid':
        statusColor = Colors.green;
        break;
      case 'Unpaid':
        statusColor = Colors.red;
        break;
      case 'Due':
        statusColor = Colors.orange;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(no),
          Text(date),
          Text(amount),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(status, style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Order Id - #ODR15203', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        _buildInstallmentRow('1', 'May 17 2024', '₹ 20,224', 'Paid'),
        _buildInstallmentRow('2', 'Nov 17 2024', '₹ 18,119', 'Unpaid'),
        _buildInstallmentRow('3', 'May 17 2025', '₹ 16,113', 'Due'),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey,
            padding: EdgeInsets.symmetric(vertical: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          child: Text('Edit', style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        padding: EdgeInsets.symmetric(vertical: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      child: Text('Save', style: TextStyle(fontSize: 16)),
    );
  }
}