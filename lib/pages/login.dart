import 'dart:convert';

import 'package:first_app/components/buttons.dart';
import 'package:first_app/components/socials.dart';
import 'package:first_app/components/text_field.dart';
import 'package:first_app/pages/users.dart';
import 'package:first_app/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:collection/collection.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final String apple = 'https://www.apple.com';
  final String facebook = 'https://www.facebook.com';
  final String snapchat = 'https://www.snapchat.com';
  final String tiktok = 'https://www.tiktok.com';

  void _launchURL(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> loggedUser() async {
    try {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(child: CircularProgressIndicator());
        },
      );

      final response = await http.post(
        Uri.parse('http://10.0.2.2:5500/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      final data = jsonDecode(response.body);

      await Future.delayed(Duration(seconds: 2));

      if (!mounted) return;

      // Navigator.pop(context);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(data['message'])));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Users()),
        );
      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(data['message'])));
      } else if (response.statusCode == 400) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(data['message'])));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login failed')));
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Connection error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 183, 224),
      body: Padding(
        padding: const EdgeInsets.only(top: 350.0, bottom: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 48, 38, 38),
                    ),
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: [
                      Text(
                        "Don't have an account with us?",
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 48, 38, 38),
                        ),
                      ),

                      SizedBox(width: 5),

                      GestureDetector(
                        child: Text(
                          'sign up',
                          style: TextStyle(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 7, 93, 192),
                          ),
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.0),

                  Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: Column(
                      children: [
                        TextController(
                          hintWord: "email",
                          textController: emailController,
                          obscureText: false,
                        ),

                        SizedBox(height: 10.0),

                        TextController(
                          hintWord: "password",
                          textController: passwordController,
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: MyButtons(onPressed: loggedUser, text: "Login"),
                ),
              ],
            ),

            SizedBox(height: 50.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Socials(
                  onPressed: () => _launchURL(apple),
                  icon: Icon(
                    Icons.apple,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    size: 30,
                  ),
                ),
                Socials(
                  onPressed: () => _launchURL(facebook),
                  icon: Icon(
                    Icons.facebook,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    size: 30,
                  ),
                ),
                Socials(
                  onPressed: () => _launchURL(snapchat),
                  icon: Icon(
                    Icons.snapchat,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    size: 30,
                  ),
                ),
                Socials(
                  onPressed: () => _launchURL(tiktok),
                  icon: Icon(
                    Icons.tiktok,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
