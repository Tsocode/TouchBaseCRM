import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/connection.dart';

class ApiService {
  final String baseUrl = "http://localhost:5000";

  Future<List<Connection>> fetchConnections() async {
    final response = await http.get(Uri.parse('$baseUrl/get_connections'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Connection.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load connections');
    }
  }

  Future<void> addConnection(Connection connection) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add_connection'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(connection.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add connection');
    }
  }
}
