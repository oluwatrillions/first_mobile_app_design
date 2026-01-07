import 'package:first_app/pages/create_account.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 183, 224),
      body: Padding(
        padding: EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 150.0),
              child: Text(
                'H O M E',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Color.fromARGB(255, 48, 38, 38),
                ),
              ),
            ),
            GestureDetector(
              child: Text(
                'sign in',
                style: TextStyle(
                  fontSize: 18,
                  backgroundColor: Color.fromARGB(255, 214, 213, 214),
                  color: Color.fromARGB(255, 7, 93, 192),
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
