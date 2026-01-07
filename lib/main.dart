// import 'package:first_app/dartDbConnect/mongo_db.dart';
import 'package:first_app/pages/create_account.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Login());
  }
}
