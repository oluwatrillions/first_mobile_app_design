import 'dart:convert';

import 'package:first_app/model/user_list.dart';
import 'package:first_app/pages/login.dart';
import 'package:first_app/providers/user_lists_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:http/http.dart" as http;

class Users extends ConsumerStatefulWidget {
  const Users({super.key});

  @override
  ConsumerState<Users> createState() => _UsersState();
}

class _UsersState extends ConsumerState<Users> {
  Future<List<UserList>> fetchUserList() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:5500/users'),
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

  @override
  void initState() {
    super.initState();
    fetchUserList();
  }

  @override
  Widget build(BuildContext context) {
    final usersNotifier = ref.watch(userListsProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () =>
                  ref.read(userListsProvider.notifier).refreshUsers(),
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
          backgroundColor: Color.fromARGB(255, 218, 183, 224),
        ),
        backgroundColor: Color.fromARGB(255, 218, 183, 224),
        body: usersNotifier.when(
          data: (users) {
            if (users.isEmpty) {
              return SizedBox(
                width: 350,
                child: Text(
                  'Check out our new users',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Color.fromARGB(255, 48, 38, 38),
                  ),
                ),
              );
            }

            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.only(bottom: 20.0, right: 30.0),
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
                            user.email,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Member since: ${user.registeredDay.toString().substring(0, 10)}',
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
        ));
  }
}
