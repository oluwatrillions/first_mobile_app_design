class UserList {
  final String username;
  final String email;
  final DateTime? registeredDay;
  final String? avatar;

  UserList(
      {required this.username,
      required this.email,
      required this.registeredDay,
      this.avatar});

  // Deserializing Userlist from JSON to Map to Dart Object.
  factory UserList.fromJson(Map<String, dynamic> json) {
    return UserList(
      username: json['username'],
      email: json['email'],
      registeredDay: DateTime.tryParse(json['registeredAt']),
      avatar: json['avatar'],
    );
  }

  // Serializing Userlist from Dart Object to Map to JSON.
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'registeredAt': registeredDay?.toIso8601String(),
      'avatar': avatar,
    };
  }
}
