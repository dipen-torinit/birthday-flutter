import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum AUTHSTATE {
  checking,
  success,
  failed,
}

enum SIGN_STATE {
  initial,
  requesting,
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
    signState = SIGN_STATE.initial;
  }

  SIGN_STATE signState = SIGN_STATE.initial;
  String error = "";
  void signIn(userid, password) async {
    signState = SIGN_STATE.requesting;
    notifyListeners();

    //Added dummy delay to check the state changes
    Future.delayed(const Duration(milliseconds: 1000), () async {
      try {
        UserCredential result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: userid, password: password);
        log("Sign In Successful ${result.user}");
        signState = SIGN_STATE.success;
      } catch (e) {
        log("Sign In Failed: $e");
        error = e.toString();
        signState = SIGN_STATE.failed;
      }
      notifyListeners();
    });
  }

  void signUp(userid, password) async {
    signState = SIGN_STATE.requesting;
    notifyListeners();

    //Added dummy delay to check the state changes
    Future.delayed(const Duration(milliseconds: 1000), () async {
      try {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: userid, password: password);
        log("Sign Up Successful ${result.user}");
        signState = SIGN_STATE.success;
      } catch (e) {
        log("Sign Up Failed: $e");
        error = e.toString();
        signState = SIGN_STATE.failed;
      }
      notifyListeners();
    });
  }
}
