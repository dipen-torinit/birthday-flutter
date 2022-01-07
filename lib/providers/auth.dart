import 'dart:async';

import 'package:flutter/material.dart';

enum AUTHSTATE {
  checking,
  success,
  failed,
}

class Auth with ChangeNotifier {
  AUTHSTATE isAuth = AUTHSTATE.checking;

  void authenticate() {
    Timer(const Duration(seconds: 5), () {
      isAuth = AUTHSTATE.failed;
      notifyListeners();
    });
  }
}
