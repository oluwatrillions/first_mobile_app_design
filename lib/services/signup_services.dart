import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupServices {
  final String baseUrl = 'http://10.0.2.2:5500';

  Future<Map<String, dynamic>> signUpUser({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
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

      if (response.statusCode == 201 || response.statusCode == 200) {
        return {
          'success': true,
          'message': data['message'],
        };
      } else if (response.statusCode == 400) {
        return {
          'success': false,
          'message': data['message'],
        };
      } else if (response.statusCode == 409) {
        return {
          'success': false,
          'message': data['message'],
        };
      } else {
        return {
          'success': false,
          'message':
              'Unexpected error: ${response.statusCode}. Signup failed, please try again.',
        };
      }
    } catch (e) {
      throw Exception('Connection error: $e');
    }
  }
}
