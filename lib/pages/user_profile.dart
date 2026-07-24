import 'dart:convert';

import 'package:first_app/model/user.dart';
import 'package:first_app/providers/login_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserProfile extends ConsumerStatefulWidget {
  const UserProfile({super.key});

  @override
  ConsumerState<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends ConsumerState<UserProfile> {
  final _storage = const FlutterSecureStorage();
  User? userData;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    final payload = await _storage.read(key: 'payload');
    print(payload);
    if (payload != null) {
      setState(() {
        userData = User.fromJson(jsonDecode(payload));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userData == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
          backgroundColor: Color.fromARGB(255, 218, 183, 224),
        ),
        backgroundColor: Color.fromARGB(255, 218, 183, 224),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                      'http://10.0.2.2:5500/public/avatar/${userData!.avatar}'),
                ),
                const SizedBox(height: 16),
                Text(
                  'Username: ${userData!.username}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  'Email: ${userData!.email}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
