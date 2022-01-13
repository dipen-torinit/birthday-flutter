import 'dart:developer';

import 'package:birthday_flutter/navigation/tab_screen.dart';
import 'package:birthday_flutter/providers/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Consumer<Auth>(builder: (context, authResponse, child) {
      String requestState = "";
      if (authResponse.signState == SIGN_STATE.requesting) {
        requestState = "Running";
      } else if (authResponse.signState == SIGN_STATE.success) {
        requestState = "Success";
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          Navigator.pushNamed(context, TabsScreen.routeName);
        });
      } else if (authResponse.signState == SIGN_STATE.failed) {
        requestState = authResponse.error;
      }
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
                Text(requestState),
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
                      'Sign In',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Provider.of<Auth>(context, listen: false).signIn(
                            loginIdController.text, passwordController.text);
                      }
                    }),
                TextButton(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Provider.of<Auth>(context, listen: false).signUp(
                            loginIdController.text, passwordController.text);
                      }
                    })
              ],
            ),
          ),
        ),
      );
    });
  }
}
