class UserList {
  final String username;
  final String email;
  final DateTime registeredDay;

  UserList({
    required this.username,
    required this.email,
    required this.registeredDay,
  });

  factory UserList.fromJson(Map<String, dynamic> json) {
    return UserList(
      username: json['username'],
      email: json['email'],
      registeredDay: DateTime.parse(json['registeredDay']),
    );
  }
}
