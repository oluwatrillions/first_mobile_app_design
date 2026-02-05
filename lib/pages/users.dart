import 'dart:convert';

import 'package:first_app/model/user_list.dart';
import 'package:first_app/pages/login.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class Users extends StatefulWidget {
  Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  late Future<List<UserList>> userList;

  List<dynamic> getUsers = [
    ["Gonzalo Flores", "floresg@havilah.com", "2024-06-06"],
    ["Mike Trump", "trumpeter@yahoo.com", "2026-01-06"],
    ["Johm Sandra", "sandy_jg@gmail.com", "2024-08-09"],
    ["Chris Page", "pager@nxt.com", "2025-24-12"],
  ];

  Future<List<UserList>> fetchUserList() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5500/users'));
    List data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(data);
      return data.map((json) => UserList.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load user list');
    }
  }

  @override
  void initState() {
    super.initState();
    userList = fetchUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Color.fromARGB(255, 218, 183, 224),
      ),
      backgroundColor: Color.fromARGB(255, 218, 183, 224),
      body: Padding(
        padding: EdgeInsets.only(top: 30.0, left: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 350,
              child: Text(
                'Check out our new users',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Color.fromARGB(255, 48, 38, 38),
                ),
              ),
            ),
            SizedBox(height: 30.0),

            Expanded(
              child: ListView.builder(
                itemCount: getUsers.length,
                itemBuilder: (context, index) {
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
                            getUsers[index][0],
                            style: TextStyle(
                              fontSize: 20.0,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          Text(
                            getUsers[index][1],
                            style: TextStyle(
                              fontSize: 18.0,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Member since: ${getUsers[index][2]}',
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
