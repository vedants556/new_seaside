import 'package:flutter/material.dart';

class PrivacySettingsScreen extends StatefulWidget {
  @override
  _PrivacySettingsScreenState createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  bool locationSharing = true;
  bool dataCollection = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Location Sharing'),
            value: locationSharing,
            onChanged: (value) {
              setState(() {
                locationSharing = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Data Collection'),
            value: dataCollection,
            onChanged: (value) {
              setState(() {
                dataCollection = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
