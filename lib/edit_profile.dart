import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  final String userName = "Mayank Chowdhary"; // Replace with actual user name
  final String userPhone = "9831318999"; // Replace with actual user phone number
  final String userAddress = "122, Hyphen Street, Liluah, Howrah - 07"; // Replace with actual user address

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications button action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    userName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    userPhone,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Text(
                    userAddress,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          // Handle add profile action
                        },
                        icon: Icon(Icons.add),
                        label: Text("Add Profile"),
                      ),
                      SizedBox(width: 20),
                      TextButton.icon(
                        onPressed: () {
                          // Handle switch profile action
                        },
                        icon: Icon(Icons.swap_horiz),
                        label: Text("Switch Profile"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(height: 40),
            _buildProfileOption(context, "Edit Profile Image"),
            _buildProfileOption(context, "Edit Name"),
            _buildProfileOption(context, "Edit Number"),
            _buildProfileOption(context, "Edit Address"),
            _buildProfileOption(context, "Edit Documents"),
            _buildProfileOption(context, "Edit E-mail"),
            _buildProfileOption(context, "Enter UPI ID"),
            _buildProfileOption(context, "Upload Payment QR"),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, String title) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Handle profile option tap
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EditProfilePage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}
