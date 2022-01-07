import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/Home";

  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: const Center(
          child: Text(
            'Home Screen',
            style: TextStyle(
                color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
