import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import "dart:convert";

class LoginServices {
  final String baseUrl = 'http://10.0.2.2:5500';
  final _storage = const FlutterSecureStorage();

  Future<Map<String, dynamic>> loggedUser(
      {required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      Map<String, dynamic> data;

      try {
        data = jsonDecode(response.body);
      } catch (e) {
        return {
          'success': false,
          'message': 'Invalid response from server',
        };
      }

      if (response.statusCode == 200) {
        await _storage.write(key: 'access_token', value: data['accessToken']);
        await _storage.write(key: 'refresh_token', value: data['refreshToken']);
        return {
          'success': true,
          'message': data['message'],
          'payload': data['payload'],
        };
      } else if (response.statusCode == 401) {
        return {
          'success': false,
          'message': data['message'],
        };
      } else if (response.statusCode == 400) {
        return {
          'success': false,
          'message': data['message'],
        };
      } else if (response.statusCode == 500) {
        return {
          'success': false,
          'message': data['message'],
        };
      } else {
        return {
          'success': false,
          'message':
              'Unexpected error: ${response.statusCode}. Login failed, please try again.',
        };
      }
    } catch (e) {
      throw Exception('Connection error: $e');
    }
  }

  Future<Map<String, dynamic>> logoutUser({required String email}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/logout'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      Map<String, dynamic> data;

      try {
        data = jsonDecode(response.body);
      } catch (e) {
        throw Exception('Invalid response from server');
      }

      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': data['message'],
        };
      } else {
        return {
          'success': false,
          'message': data['message'],
        };
      }
    } catch (e) {
      throw Exception('Logout failed: $e');
    }
  }
}
