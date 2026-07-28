import 'dart:convert';

import 'package:first_app/model/user.dart';
import 'package:first_app/providers/login_providers.dart';
import 'package:first_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserProfile extends ConsumerStatefulWidget {
  final String id;

  const UserProfile({super.key, required this.id});

  @override
  ConsumerState<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends ConsumerState<UserProfile> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(userProvider.notifier).fetchUser(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: userData.when(
        data: (user) {
          if (user == null) return const Center(child: Text('No user found'));
          return Column(
            children: [
              Text(user.username),
              Text(user.email),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
