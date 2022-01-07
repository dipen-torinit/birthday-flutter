import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/Login";

  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.cyan,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(hintText: "Enter login id"),
            ),
            const TextField(
              decoration: InputDecoration(hintText: "Enter password"),
            ),
            TextButton(
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
