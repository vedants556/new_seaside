import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  @override
  _NotificationSettingsScreenState createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool pushNotifications = true;
  bool emailNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Push Notifications'),
            value: pushNotifications,
            onChanged: (value) {
              setState(() {
                pushNotifications = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Email Notifications'),
            value: emailNotifications,
            onChanged: (value) {
              setState(() {
                emailNotifications = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
