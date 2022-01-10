import 'package:birthday_flutter/model/person.dart';
import 'package:birthday_flutter/navigation/tab_screen.dart';
import 'package:birthday_flutter/screens/birthday_detail_screen.dart';
import 'package:birthday_flutter/screens/birthday_list_screen.dart';
import 'package:birthday_flutter/screens/error_screen.dart';
import 'package:birthday_flutter/screens/login_screen.dart';
import 'package:birthday_flutter/screens/settings_screen.dart';
import 'package:birthday_flutter/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var arg = settings.arguments;

    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case TabsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const TabsScreen());
      case BirthdayListScreen.routeName:
        return MaterialPageRoute(builder: (_) => const BirthdayListScreen());
      case SettingsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case BirthdayDetailScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => BirthdayDetailScreen(
                  person: arg as Person,
                ));
      default:
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}
