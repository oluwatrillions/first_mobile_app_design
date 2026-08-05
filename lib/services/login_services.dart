import "package:first_app/services/token_services.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import "dart:convert";

class LoginServices {
  final String baseUrl = 'http://10.0.2.2:5500';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

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
        await TokenService().saveToken(data['accessToken']);
        await _storage.write(key: 'refresh_token', value: data['refreshToken']);
        await _storage.write(
            key: 'payload', value: jsonEncode(data['payload']));
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

      if (response.statusCode == 200) {
        await TokenService().deleteToken();
        await _storage.delete(key: 'refresh_token');
        await _storage.delete(key: 'payload');
        return {
          'success': true,
          'message': jsonDecode(response.body)['message'],
        };
      } else {
        throw Exception('Logout failed');
      }
    } catch (e) {
      throw Exception('Connection error: $e');
    }
  }
}
