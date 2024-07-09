import 'package:flutter/material.dart';

class OrderDetailPage extends StatelessWidget {
  final Map<String, dynamic> order;

  OrderDetailPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order No. ${order["orderID"]}'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAddressSection(
              context,
              title: "Distributor's Name",
              address: "Distributor's Address",
              color: Colors.green,
              icon: Icons.store,
            ),
            _buildAddressSection(
              context,
              title: "Ferry's Name",
              address: "Ferry's Address",
              color: Colors.orange,
              icon: Icons.directions_boat,
            ),
            _buildAddressSection(
              context,
              title: "Customer's Name",
              address: "Customer's Address",
              color: Colors.black,
              icon: Icons.person,
            ),
            Divider(height: 40),
            Text('Order Details', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),
            ..._buildOrderDetails(),
            Divider(height: 40),
            _buildAmountDetails(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressSection(
      BuildContext context, {
        required String title,
        required String address,
        required Color color,
        required IconData icon,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: color, size: 30),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
              Text(address, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildOrderDetails() {
    return List.generate(3, (index) {
      return Column(
        children: [
          ListTile(
            title: Text('# Product Name', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Product Category\nSize - 16 x 20ft\nGSM - 120 GSM\nColour - Blue\nQuantity - 3 Packets'),
            trailing: Text('₹ 21,000', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Divider(),
        ],
      );
    });
  }

  Widget _buildAmountDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAmountRow(context, label: 'Gross Amount', amount: '₹ 84,000', isBold: true, color: Colors.orange),
        _buildAmountRow(context, label: 'Packaging', amount: '₹ 805'),
        _buildAmountRow(context, label: 'Delivery', amount: '₹ 1,195'),
        _buildAmountRow(context, label: 'Taxes', amount: 'N/A'),
        SizedBox(height: 10),
        _buildAmountRow(context, label: 'Net Amount', amount: '₹ 86,000', isBold: true, color: Colors.green),
        _buildAmountRow(context, label: 'Reward Points Earned', amount: '86 pts'),
      ],
    );
  }

  Widget _buildAmountRow(BuildContext context, {required String label, required String amount, bool isBold = false, Color color = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: color)),
          Text(amount, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: color)),
        ],
      ),
    );
  }
}
