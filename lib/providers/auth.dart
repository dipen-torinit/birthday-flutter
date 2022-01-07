import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum AUTHSTATE {
  checking,
  success,
  failed,
}

class Auth with ChangeNotifier {
  AUTHSTATE isAuth = AUTHSTATE.checking;

  void authenticate() {
    Timer(const Duration(seconds: 3), () {
      isAuth = FirebaseAuth.instance.currentUser == null
          ? AUTHSTATE.failed
          : AUTHSTATE.success;
      notifyListeners();
    });
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    isAuth = AUTHSTATE.checking;
  }
}
