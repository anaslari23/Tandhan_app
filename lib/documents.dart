import 'package:flutter/material.dart';

class DocumentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documents'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDocumentCard(context, 'Aadhar', Icons.credit_card),
            SizedBox(height: 16),
            _buildDocumentCard(context, 'GST', Icons.account_balance),
            SizedBox(height: 16),
            _buildDocumentCard(context, 'Pan', Icons.perm_identity),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentCard(BuildContext context, String title, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blue),
        title: Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          // Handle card tap if necessary
        },
      ),
    );
  }
}
