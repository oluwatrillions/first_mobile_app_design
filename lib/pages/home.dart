import 'package:first_app/pages/create_account.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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

            ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.only(bottom: 30.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: const Color.fromARGB(255, 80, 163, 231),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "William Gonzalo Flores",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: const Color.fromARGB(255, 26, 24, 24),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
