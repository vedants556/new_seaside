import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('App Version'),
            subtitle: Text('1.0.0'),
          ),
          ListTile(
            title: Text('Terms of Service'),
            onTap: () {
              // Show Terms of Service
            },
          ),
          ListTile(
            title: Text('Privacy Policy'),
            onTap: () {
              // Show Privacy Policy
            },
          ),
          ListTile(
            title: Text('Open Source Licenses'),
            onTap: () {
              // Show Open Source Licenses
            },
          ),
        ],
      ),
    );
  }
}
