import 'dart:convert';

import 'package:first_app/components/mask_email.dart';
import 'package:first_app/model/user.dart';
import 'package:first_app/model/user_list.dart';
import 'package:first_app/pages/login.dart';
import 'package:first_app/pages/user_profile.dart';
import 'package:first_app/providers/login_providers.dart';
import 'package:first_app/providers/user_lists_providers.dart';
import 'package:first_app/providers/user_provider.dart';
import 'package:first_app/services/token_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import "package:http/http.dart" as http;
import 'package:intl/intl.dart';
import 'package:jwt_decode/jwt_decode.dart';

class Users extends ConsumerStatefulWidget {
  const Users({super.key});

  @override
  ConsumerState<Users> createState() => _UsersState();
}

class _UsersState extends ConsumerState<Users> {
  Future<UserList> fetchUserList() async {
    final userListsNotifier = ref.read(userlistsServicesProvider);
    return await userListsNotifier.fetchUsers();
  }

  Future<void> _fetchLoggedInUser() async {
    final storage = const FlutterSecureStorage();
    final data = await storage.read(key: 'payload');
    if (data != null) {
      final payload = jsonDecode(data);
      String id = payload['_id'];
      ref.read(userProvider.notifier).fetchUser(id);
    }
  }

  Future<void> getAccessToken() async {
    final accessToken = await TokenService().getToken();
    if (accessToken != null) {
      final data = Jwt.parseJwt(accessToken);
    } else {
      print('No access token found.');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchLoggedInUser();
    fetchUserList();
    getAccessToken();
  }

  @override
  Widget build(BuildContext context) {
    final usersState = ref.watch(userListsProvider);
    final email = ref.watch(userProvider).value?.email ?? '';
    return Scaffold(
        appBar: AppBar(
          title: Text('User\'s Page'),
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () async {
                final storage = const FlutterSecureStorage();
                final data = await storage.read(key: 'payload');
                if (data != null) {
                  final payload = jsonDecode(data);
                  final id = payload['_id'] ?? payload['id'];
                  if (id != null && context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserProfile(id: id),
                      ),
                    );
                  }
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                final logout = ref.read(loginProvider.notifier);
                final data = await logout.logoutUser(email: email);
                if (data['success'] && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(data['message'])),
                  );
                  await Future.delayed(const Duration(seconds: 1));
                  if (context.mounted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Logout failed. Please try again.')),
                  );
                }
              },
            ),
          ],
          backgroundColor: Color.fromARGB(255, 218, 183, 224),
        ),
        backgroundColor: Color.fromARGB(255, 218, 183, 224),
        body: Container(
            child: usersState.when(
          data: (users) {
            if (users.users.isEmpty) {
              return SizedBox(
                width: 350,
                child: Text(
                  'There are no users',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Color.fromARGB(255, 48, 38, 38),
                  ),
                ),
              );
            }

            return ListView.builder(
                itemCount: users.users.length,
                itemBuilder: (context, index) {
                  final user = users.users[index];
                  DateTime registeredAt = DateTime.parse(user.registeredAt);
                  final formattedDate =
                      DateFormat('MMM d, yyyy h:mm a').format(registeredAt);
                  return Card(
                    elevation: 5,
                    margin:
                        EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: const Color.fromARGB(255, 131, 187, 233),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.username,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          Text(
                            user.email == email
                                ? user.email
                                : maskEmail(user.email),
                            style: TextStyle(
                              fontSize: 18.0,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'http://10.0.2.2:5500/public/avatar/${user.avatar}')),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Member since: $formattedDate',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Text(
              'Error: $error',
              style: TextStyle(color: Colors.red),
            ),
          ),
        )));
  }
}
