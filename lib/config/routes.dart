import 'package:flutter/material.dart';
import '../core/widgets_App/botton_navigation.dart';
import '../features/authentication/view/login.dart';
import '../features/authentication/view/register.dart';
import '../features/authentication/view/set_password.dart';
import '../features/authentication/view/welcome.dart';
import '../features/map/view/map.dart';
import '../features/onBording/view/onBording.dart';


class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(settings, OnBording());

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

      case '/Welcome':
        return _materialRoute(settings,Welcome());

      case '/MapScreen':
      return _materialRoute(settings,MapScreen());

      case '/ButtomNavBar':
        return _materialRoute(settings,ButtomNavBar());

      default:
        return _materialRoute( settings,OnBording());
    }
  }

  static Route<dynamic> _materialRoute(RouteSettings settings,Widget view) {
    return MaterialPageRoute(settings: settings,builder: (_) => view);
  }
}