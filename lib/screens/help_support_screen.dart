import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('FAQs'),
            onTap: () {
              // Navigate to FAQs page
            },
          ),
          ListTile(
            title: Text('Contact Us'),
            onTap: () {
              // Show contact information or form
            },
          ),
          ListTile(
            title: Text('Report a Problem'),
            onTap: () {
              // Show problem reporting form
            },
          ),
        ],
      ),
    );
  }
}
