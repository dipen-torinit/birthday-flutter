import 'dart:developer';

import 'package:birthday_flutter/navigation/tab_screen.dart';
import 'package:birthday_flutter/screens/birthday_list_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/Login";

  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.cyan,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: loginIdController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    hintText: "Enter login id", labelText: "Login ID"),
              ),
              TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    hintText: "Enter password", labelText: "Password"),
                obscureText: true,
              ),
              TextButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        UserCredential result = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: loginIdController.text,
                                password: passwordController.text);
                        Navigator.pushNamed(context, TabsScreen.routeName);
                      } catch (e) {
                        log(e.toString());
                      }
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
