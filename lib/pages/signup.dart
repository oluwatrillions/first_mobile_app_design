import 'package:first_app/components/buttons.dart';
import 'package:first_app/components/text_field.dart';
import 'package:first_app/pages/create_account.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 57, 58),
      body: Scaffold(
        backgroundColor: const Color.fromARGB(255, 218, 183, 224),
        body: Padding(
          padding: const EdgeInsets.only(top: 350.0, bottom: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
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
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20.0),

                    Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: Column(
                        children: [
                          TextController(
                            hintWord: "name",
                            textController: usernameController,
                          ),

                          const SizedBox(height: 10.0),

                          TextController(
                            hintWord: "email or phone",
                            textController: emailController,
                          ),

                          const SizedBox(height: 10.0),

                          TextController(
                            hintWord: "password",
                            textController: passwordController,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: MyButtons(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      text: "Sign up",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
