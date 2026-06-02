import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupServices {
  final String baseUrl = 'http://10.0.2.2:5500';

  Future<Map<String, dynamic>> signUpUser({
    required String username,
    required String email,
    required String password,
    File? avatar,
  }) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/signup'),
      );

      request.fields['username'] = username;
      request.fields['email'] = email;
      request.fields['password'] = password;

      if (avatar != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'avatar',
            avatar.path,
          ),
        );
      }

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      final data = jsonDecode(responseBody);

      if (response.statusCode == 201) {
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
      return {
        "success": false,
        "message": 'Connection error: $e',
      };
    }
  }
}
