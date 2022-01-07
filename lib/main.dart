import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth.dart';
import 'routes/router.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<FirebaseApp> _initializeApp = Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => Auth())],
    child: FutureBuilder(
        future: _initializeApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            log("error ${snapshot.error}");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return const MyApp();
          }
          return const CircularProgressIndicator();
        }),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Birthday Reminder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
    );
  }
}
