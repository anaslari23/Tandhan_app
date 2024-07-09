import 'package:flutter/material.dart';
import 'detail_order_screen.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Toll Free Number 1800 5566"),
            SizedBox(height: 20),
            Text(
              "Track Your Order",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildOrderItem(context, "Shadenets", "20x12ft 20 GSM | Green", 1, "Out for Delivery"),
            _buildOrderItem(context, "Tarpaulins", "24x12ft 200 GSM | Yellow", 2, "Packed"),
            ElevatedButton(
              onPressed: () {
                // Handle "Raise A Ticket" action
              },
              child: Text("Raise A Ticket"),
            ),
            SizedBox(height: 20),
            Text(
              "WHAT ISSUES ARE YOU FACING?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildSupportOption(context, "WANT TO MANAGE MY ORDER?", "View, cancel or return an order"),
            _buildSupportOption(context, "WANT TO CONTACT THE DISTRIBUTOR?", "Deactivate, Customer review, Upgrade, etc."),
            _buildSupportOption(context, "WANT TO CREATE NEW ACCOUNT?", "New account create for an individual"),
            _buildSupportOption(context, "WANT TO KNOW MORE?", "Know app features and tutorials."),
            _buildSupportOption(context, "OTHERS", "Select your own issue."),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(BuildContext context, String title, String description, int quantity, String status) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.image, size: 50), // Placeholder for product image
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(description),
                      SizedBox(height: 4),
                      Text(status, style: TextStyle(color: Colors.green)),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "$quantity",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Text("Packet(s)", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Download invoice"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Order Again"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportOption(BuildContext context, String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailPage(order: {
              'orderID': '123456',
              'title': title,
              'subtitle': subtitle,
              'quantity': 2,
              'status': 'Pending'
            }),
          ),
        );
      },
    );
  }
}

