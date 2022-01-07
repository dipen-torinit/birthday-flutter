import 'package:birthday_flutter/providers/auth.dart';
import 'package:birthday_flutter/screens/splash_screen.dart';
import 'package:birthday_flutter/widgets/progress_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Home Screen',
            style: TextStyle(
                color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          ProgressButton(
              label: "Logout",
              callback: () {
                Provider.of<Auth>(context, listen: false).signOut();
                Navigator.pushNamed(context, SplashScreen.routeName);
              },
              showProgress: false)
        ],
      ),
    );
  }
}
