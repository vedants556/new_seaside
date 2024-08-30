import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/beach.dart';

class BeachService {
  final String _baseUrl = 'https://api.example.com/beaches'; // Replace with your API URL

  Future<List<Beach>> fetchBeaches(String location) async {
    final response = await http.get(Uri.parse('$_baseUrl?location=$location'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Beach.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load beaches');
    }
  }
}
