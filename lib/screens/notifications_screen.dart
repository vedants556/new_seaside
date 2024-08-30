import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  // Sample notifications; replace with actual data source
  final List<Map<String, String>> alerts = [
    {'title': 'High Wave Alert', 'body': 'High waves detected at Goa Beach.'},
    {'title': 'Storm Surge Warning', 'body': 'Storm surge detected at Chennai Beach.'},
  ];

  final List<Map<String, String>> warnings = [
    {'title': 'Poor Water Quality', 'body': 'Poor water quality detected at Juhu Beach.'},
    {'title': 'High Salinity', 'body': 'High salinity levels detected at Kovalam Beach.'},
  ];

  final List<Map<String, String>> updates = [
    {'title': 'Weather Update', 'body': 'Clear skies expected at Marine Drive.'},
    {'title': 'Ocean Temperature', 'body': 'Current ocean temperature at 28°C in Palolem Beach.'},
  ];

  NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Alerts'),
              Tab(text: 'Warnings'),
              Tab(text: 'Updates'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildNotificationList(
              alerts,
              'No alerts available',
            ),
            _buildNotificationList(
              warnings,
              'No warnings available',
            ),
            _buildNotificationList(
              updates,
              'No updates available',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList(List<Map<String, String>> notifications, String emptyMessage) {
    return notifications.isNotEmpty
        ? ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return ListTile(
          title: Text(notification['title'] ?? 'No Title'),
          subtitle: Text(notification['body'] ?? 'No Details Available'),
          leading: const Icon(
            Icons.notification_important,
            color: Colors.teal,
          ),
          onTap: () {
            // Handle tap on notification (e.g., navigate or show more details)
          },
        );
      },
    )
        : Center(
      child: Text(emptyMessage),
    );
  }
}
