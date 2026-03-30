import "package:first_app/model/user_list.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "dart:convert";

class UserLists {
  final String baseUrl = 'http://10.0.2.2:5500';

  Future<List<UserList>> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> userList = jsonDecode(response.body);
        return userList.map((json) => UserList.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load user list');
      }
    } catch (error) {
      throw Exception('Failed to load user list: $error');
    }
  }
}
