import 'package:flutter/material.dart';
import '../core/widgets_App/botton_navigation.dart';
import '../features/aboutUs/view/aboutus_screen.dart';
import '../features/authentication/view/login.dart';
import '../features/authentication/view/register.dart';
import '../features/authentication/view/set_password.dart';
import '../features/authentication/view/welcome.dart';
import '../features/helpAndSupport/view/helpAndSupport_screen.dart';
import '../features/map/view/map.dart';
import '../features/onBording/view/onBording.dart';
import '../features/setting/view/changeLanguage.dart';
import '../features/setting/view/changePassword.dart';
import '../features/setting/view/contactus_screen.dart';
import '../features/setting/view/deleteAccount_screen.dart';
import '../features/setting/view/policy_screen.dart';
import '../features/setting/view/setting_screen.dart';
import '../features/wallet/view/add_amount.dart';
import '../features/wallet/view/wallet_Info.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(settings, OnBording());

      case '/Register':
        return _materialRoute(settings, Register());

      case '/SetPassword':
        final args = settings.arguments as SetPassword;
        return _materialRoute(
            settings,
            SetPassword(
              fitrstName: args.fitrstName,
              lastName: args.lastName,
              mobail: args.mobail,
              userName: args.userName,
              birthDate: args.birthDate,
            ));

      case '/Login':
        return _materialRoute(settings, Login());

      case '/Welcome':
        return _materialRoute(settings, const Welcome());

      case '/MapScreen':
        return _materialRoute(settings, MapScreen());

      case '/ButtomNavBar':
        return _materialRoute(settings, const ButtomNavBar());

      case '/AddAmont':
        return _materialRoute(settings, const AddAmont());

      case '/Setting':
        return _materialRoute(settings, const SettingScreen());

      case '/ChangePassword':
        return _materialRoute(settings, const Changepassword());

      case '/Changelanguage':
        return _materialRoute(settings, const Changelanguage());

      case '/PolicyScreen':
        return _materialRoute(settings, const PolicyScreen());

      case '/ContactusScreen':
        return _materialRoute(settings, const ContactusScreen());

      case '/DeleteaccountScreen':
        return _materialRoute(settings, const DeleteaccountScreen());

      case '/HelpandsupportScreen':
        return _materialRoute(settings, const HelpandsupportScreen());

        case '/AboutusScreen':
        return _materialRoute(settings, const AboutusScreen());
         case '/WalletInfo':
        return _materialRoute(settings, const WalletInfo());

      default:
        return _materialRoute(settings, OnBording());
    }
  }

  static Route<dynamic> _materialRoute(RouteSettings settings, Widget view) {
    return MaterialPageRoute(settings: settings, builder: (_) => view);
  }
}
