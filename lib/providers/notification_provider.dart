import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/notification_model.dart';
import 'package:http/http.dart' as http;

class NotificationProvider with ChangeNotifier {
  List<NotificationModel> _notifications = [];
  bool _isLoading = false;
  final String _apiUrl = 'https://api.example.com/notifications'; // Replace with your API URL

  List<NotificationModel> get notifications => _notifications;
  bool get isLoading => _isLoading;

  Future<void> fetchNotifications() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(_apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _notifications = data.map((json) => NotificationModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load notifications');
      }
    } catch (error) {
      print('Error fetching notifications: $error');
      // Handle errors or show user-friendly error messages
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
