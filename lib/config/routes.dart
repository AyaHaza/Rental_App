import 'package:flutter/material.dart';
import '../core/widgets_App/botton_navigation.dart';
import '../features/authentication/presentation_layer/view/login.dart';
import '../features/authentication/presentation_layer/view/register.dart';
import '../features/authentication/presentation_layer/view/set_password.dart';
import '../features/authentication/presentation_layer/view/welcome.dart';


class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(settings, Welcome());

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

      case '/ButtomNavBar':
        return _materialRoute(settings,ButtomNavBar());

      default:
        return _materialRoute( settings,Welcome());
    }
  }

  static Route<dynamic> _materialRoute(RouteSettings settings,Widget view) {
    return MaterialPageRoute(settings: settings,builder: (_) => view);
  }
}