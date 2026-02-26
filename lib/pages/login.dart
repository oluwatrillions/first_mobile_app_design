import 'dart:convert';

import 'package:first_app/components/buttons.dart';
import 'package:first_app/components/my_spinner.dart';
import 'package:first_app/components/socials.dart';
import 'package:first_app/components/form_field.dart';
import 'package:first_app/pages/users.dart';
import 'package:first_app/pages/signup.dart';
import 'package:first_app/providers/login_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:collection/collection.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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

  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formkey.currentState!.validate()) return;

    final notifier = ref.read(loginProvider.notifier);

    await notifier.loginUser(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());

    if (!mounted) return;

    final state = ref.read(loginProvider);

    state.when(
      data: (message) {
        if (message != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );

          if (!mounted) return;

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Users()),
          );
        }
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      },
    );
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
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          FormController(
                            labelText: "email",
                            textController: _emailController,
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Icons.email,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Please enter your email";
                              }
                              if (value.trim().length < 4) {
                                return "Email must be at least 4 characters";
                              }
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return "Please enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10.0),
                          FormController(
                            labelText: "password",
                            textController: _passwordController,
                            obscureText: true,
                            prefixIcon: Icons.lock,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Please enter your password";
                              }
                              if (value.trim().length < 6) {
                                return "Password must be at least 6 characters";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
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
                  child: MyButtons(onPressed: _handleLogin, text: "Login"),
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
