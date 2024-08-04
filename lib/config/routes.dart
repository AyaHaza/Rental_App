import 'package:flutter/material.dart';
import '../features/authentication/view/login.dart';
import '../features/authentication/view/register.dart';
import '../features/authentication/view/set_password.dart';
import '../features/home.dart';


class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(settings, Register());

      case '/Register':
        return _materialRoute(settings,Register());

      case '/SetPassword':
        final args = settings.arguments as SetPassword;
        return _materialRoute(settings,SetPassword(
          fitrstName: args.fitrstName,
          lastName: args.lastName,
          mobail: args.mobail,
          userName: args.userName,
          birthDate: args.birthDate,
        ));

      case '/Login':
        return _materialRoute(settings,Login());

      case '/HomeScreen':
        return _materialRoute(settings,HomeScreen());


      default:
        return _materialRoute( settings,Register());
    }
  }

  static Route<dynamic> _materialRoute(RouteSettings settings,Widget view) {
    return MaterialPageRoute(settings: settings,builder: (_) => view);
  }
}