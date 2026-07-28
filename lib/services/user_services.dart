import "package:first_app/model/user.dart";
import "package:http/http.dart" as http;
import "dart:convert";

class UserServices {
  final String baseUrl = 'http://10.0.2.2:5500/users';

  Future<User> fetchUser(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
      );
      print('Fetching user with ID: $baseUrl/$id');

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final userData = jsonDecode(response.body);
        print('userData: $userData');
        return User.fromJson(userData);
      } else {
        throw Exception('Failed to load user');
      }
    } catch (error) {
      throw Exception('Failed to load user: $error');
    }
  }
}
