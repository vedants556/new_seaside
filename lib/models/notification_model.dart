// lib/models/notification_model.dart

class NotificationModel {
  final String id;        // Unique identifier for the notification
  final String title;     // Title of the notification
  final String body;      // Body content of the notification
  final String type;      // Type of notification (e.g., alert, info, etc.)
  final DateTime date;    // Date and time when the notification was created
  final String? payload;  // Optional payload for additional data

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    required this.date,
    this.payload,
  });

  // Factory constructor to create a NotificationModel from a JSON object
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      type: json['type'] as String,
      date: DateTime.parse(json['date'] as String),
      payload: json['payload'] as String?,
    );
  }

  // Method to convert NotificationModel instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'type': type,
      'date': date.toIso8601String(),
      'payload': payload,
    };
  }

  // Override toString method for easy debugging
  @override
  String toString() {
    return 'NotificationModel(id: $id, title: $title, body: $body, type: $type, date: $date, payload: $payload)';
  }
}
