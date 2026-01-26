class LoginCredentials {
  final String email;
  final String password;

  LoginCredentials({required this.email, required this.password});

  factory LoginCredentials.fromJson(Map<String, dynamic> json) =>
      LoginCredentials(email: json['email'], password: json['password']);

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
