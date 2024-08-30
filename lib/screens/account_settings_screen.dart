import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Change Email'),
            onTap: () {
              // Implement email change functionality
            },
          ),
          ListTile(
            title: Text('Change Password'),
            onTap: () {
              // Implement password change functionality
            },
          ),
          ListTile(
            title: Text('Linked Accounts'),
            onTap: () {
              // Show linked accounts
            },
          ),
        ],
      ),
    );
  }
}
