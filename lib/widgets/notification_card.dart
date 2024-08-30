import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String body;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.body,
    this.icon = Icons.notification_important,
    this.iconColor = Colors.teal,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(body),
        leading: Icon(
          icon,
          color: iconColor,
          size: 28,
        ),
        onTap: onTap,
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
