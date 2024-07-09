import 'package:flutter/material.dart';
import 'EditAddCustomerPage.dart';
import 'wallet_page.dart';
import 'RewardPage.dart';
import 'RaiseTicket.dart';
import 'track_payment.dart';
import 'edit_profile.dart'; // Import the EditProfilePage
import 'profile_select_language.dart'; // Import ProfileSelectLanguage page
import 'documents.dart'; // Import DocumentsPage

class ProfilePage extends StatelessWidget {
  final String userName = "Mayank Chowdhary"; // Replace with actual user name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileHeader(context), // Pass context to the method
              SizedBox(height: 16),
              _buildProfileSearchBar(),
              SizedBox(height: 16),
              _buildProfileOptions(context),
              SizedBox(height: 16),
              _buildAccountSettings(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            Icons.person,
            size: 80,
            color: Colors.grey,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  userName,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfilePage()),
                    );
                  },
                  child: Text('Edit Profile'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search, color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildProfileOptions(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildProfileOptionButton(context, Icons.shopping_bag, 'Orders', OrdersPage()),
            _buildProfileOptionButton(context, Icons.local_offer, 'Offer & Schemes', RewardPage()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildProfileOptionButton(context, Icons.card_giftcard, 'Rewards', RewardsPage()),
            _buildProfileOptionButton(context, Icons.support_agent, 'Raise a Ticket', RaiseTicketPage()),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildProfileOptionButton(context, Icons.account_balance_wallet, 'TM Wallet', WalletPage()),
            _buildProfileOptionButton(context, Icons.track_changes, 'Track Payment', TrackPaymentPage()),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileOptionButton(BuildContext context, IconData icon, String label, Widget page) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Icon(icon, size: 30, color: Colors.white),
              SizedBox(height: 8),
              Text(label, style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountSettings(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account Settings',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        _buildAccountSettingItem(context, Icons.edit, 'Edit/Add Customers', EditAddCustomerPage()),
        _buildAccountSettingItem(context, Icons.notifications, 'Notification Settings', NotificationsPage()),
        _buildAccountSettingItem(context, Icons.language, 'Select Language', ProfileSelectLanguage()), // Navigate to ProfileSelectLanguage
        _buildAccountSettingItem(context, Icons.description, 'Account Statement', AccountStatementPage()),
        _buildAccountSettingItem(context, Icons.document_scanner, 'Documents', DocumentsPage()), // Navigate to DocumentsPage
      ],
    );
  }

  Widget _buildAccountSettingItem(BuildContext context, IconData icon, String label, Widget page) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(label, style: TextStyle(fontSize: 18)),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orders')),
      body: Center(
        child: Text(
          'Orders Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class RewardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rewards')),
      body: Center(
        child: Text(
          'Rewards Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Center(
        child: Text(
          'Notifications Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Language')),
      body: Center(
        child: Text(
          'Select Language Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class AccountStatementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account Statement')),
      body: Center(
        child: Text(
          'Account Statement Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class DocumentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Documents')),
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
          // Handle card tap
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}
