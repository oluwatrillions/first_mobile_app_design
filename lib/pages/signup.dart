import 'package:first_app/components/buttons.dart';
import 'package:first_app/components/my_spinner.dart';
import 'package:first_app/components/form_field.dart';
import 'package:first_app/model/user_list.dart';
import 'package:first_app/pages/login.dart';
import 'package:first_app/providers/signup_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Signup extends ConsumerStatefulWidget {
  const Signup({super.key});

  @override
  ConsumerState<Signup> createState() => _SignupState();
}

class _SignupState extends ConsumerState<Signup> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    if (!_formkey.currentState!.validate()) return;

    final notifier = ref.read(signUpProvider.notifier); //camelCase

    await notifier.signUserUp(
      username: _usernameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (!mounted) return;

    final state = ref.read(signUpProvider);

    state.when(
      data: (message) {
        if (message != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        }
      },
      loading: () => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const CircularProgressIndicator(),
      ),
      error: (error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final signupState = ref.watch(signUpProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 183, 224),
      body: Padding(
        padding: const EdgeInsets.only(top: 350.0, bottom: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 48, 38, 38),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 48, 38, 38),
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          child: Text(
                            'sign in',
                            style: TextStyle(
                              fontSize: 18,
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
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            FormController(
                              labelText: "username",
                              textController: _usernameController,
                              prefixIcon: Icons.person,
                              obscureText: false,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  print(_usernameController.text);
                                  print(_usernameController);
                                  return "Please enter your username";
                                }
                                if (value.trim().length < 4) {
                                  return "Username must be at least 4 characters";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10.0),
                            FormController(
                                labelText: "email",
                                textController: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                prefixIcon: Icons.email,
                                obscureText: false,
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
                                }),
                            const SizedBox(height: 10.0),
                            FormController(
                              labelText: "password",
                              textController: _passwordController,
                              obscureText: true,
                              prefixIcon: Icons.lock,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your password";
                                }
                                if (value.length < 6) {
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
            ),
            const SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: MyButtons(
                    onPressed:
                        signupState.isLoading ? null : () => _handleSignUp(),
                    text: signupState.isLoading ? "Signing up..." : "Sign up",
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
