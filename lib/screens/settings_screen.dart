import 'package:birthday_flutter/providers/auth.dart';
import 'package:birthday_flutter/screens/splash_screen.dart';
import 'package:birthday_flutter/widgets/progress_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = "/Settings";

  const SettingsScreen({Key? key}) : super(key: key);
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
