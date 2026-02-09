class UserList {
  final String username;
  final String email;
  final DateTime? registeredDay;

  UserList({required this.username, required this.email, this.registeredDay});

  factory UserList.fromJson(Map<String, dynamic> json) {
    return UserList(
      username: json['username'],
      email: json['email'],
      registeredDay: DateTime.tryParse(json['registeredAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'registeredAt': registeredDay?.toIso8601String(),
    };
  }
}
