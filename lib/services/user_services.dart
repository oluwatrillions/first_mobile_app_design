import "package:first_app/model/user.dart";
import "package:http/http.dart" as http;
import "dart:convert";

class UserServices {
  final String baseUrl = 'http://10.0.2.2:5500/user';

  Future<User> fetchUser(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final userData = jsonDecode(response.body);
        return User.fromJson(userData);
      } else {
        throw Exception('Failed to load user');
      }
    } catch (error) {
      throw Exception('Failed to load user: $error');
    }
  }
}
