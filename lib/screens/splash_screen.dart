import 'package:birthday_flutter/providers/auth.dart';
import 'package:birthday_flutter/widgets/progress_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/";

  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //Check user authenticity
    Provider.of<Auth>(context, listen: false).authenticate();
  }

  @override
  Widget build(BuildContext context) {
    pressButton() {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }

    return Consumer<Auth>(builder: (context, auth, child) {
      //If user is authorized then move to Home sreen else Login screen
      if (auth.isAuth == AUTHSTATE.success) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        });
      } else if (auth.isAuth == AUTHSTATE.failed) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        });
      }
      return Scaffold(
        body: Container(
          color: Colors.black87,
          child: Center(
            child: ProgressButton(
              label: "Splash Screen",
              callback: pressButton,
              showProgress: (auth.isAuth == AUTHSTATE.checking),
            ),
          ),
        ),
      );
    });
  }
}
