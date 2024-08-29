import 'package:flutter/material.dart';
import '../core/widgets_App/botton_navigation.dart';
import '../features/aboutUs/view/aboutus_screen.dart';
import '../features/authentication/view/login.dart';
import '../features/authentication/view/register.dart';
import '../features/authentication/view/set_password.dart';
import '../features/authentication/view/welcome.dart';
import '../features/helpAndSupport/view/helpAndSupport_screen.dart';
import '../features/bicyles/view/add_bicycles.dart';
import '../features/bicyles/view/all_bicyles.dart';
import '../features/bicyles/view/edit_bicycle.dart';
import '../features/map/view/add_hub.dart';
import '../features/map/view/all_hubs.dart';
import '../features/map/view/edit_hub.dart';
import '../features/map/view/map.dart';
import '../features/map/view/search_hub.dart';
import '../features/onBording/view/onBording.dart';
import '../features/setting/view/changeLanguage.dart';
import '../features/setting/view/changePassword.dart';
import '../features/setting/view/contactus_screen.dart';
import '../features/setting/view/deleteAccount_screen.dart';
import '../features/setting/view/policy_screen.dart';
import '../features/setting/view/setting_screen.dart';
import '../features/wallet/view/add_amount.dart';
import '../features/wallet/view/wallet_Info.dart';
import '../features/transport/view/hub_content.dart';
import '../features/transport/view/select_avaialble_transport.dart';
import '../features/transport/view/select_transport.dart';
import '../features/transport/view/show_or_rental4.dart';
import '../features/transport/view/transport_detail.dart';


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
        return _materialRoute(settings,MapScreen());
        
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

      case '/SelectTransport':
        final args = settings.arguments as SelectTransport;
        return _materialRoute(settings,SelectTransport(
          hubId: args.hubId,
        ));

      case '/SlectAvailableTransport':
        final args = settings.arguments as SlectAvailableTransport;
        return _materialRoute(settings,SlectAvailableTransport(
          nameTransport: args.nameTransport,
        ));

      case '/ShowOrRental':
        final args = settings.arguments as ShowOrRental;
        return _materialRoute(settings,ShowOrRental(
          nameTransport: args.nameTransport,
          hubId: args.hubId,
        ));

      case '/HubContent':
      final args = settings.arguments as HubContent;
      return _materialRoute(settings,HubContent(
        nameTransport: args.nameTransport,
        hubId: args.hubId,
      ));

      case '/BicycleDetail':
      final args = settings.arguments as BicycleDetail;
      return _materialRoute(settings,BicycleDetail(
        bicycleId: args.bicycleId,
      ));

      case '/SraechHub':
        final args = settings.arguments as SraechHub;
        return _materialRoute(settings,SraechHub(
          youLocation: args.youLocation,
          hubs: args.hubs,
          hubsSupa: args.hubsSupa,
        ));

      case '/AllHubs':
        final args = settings.arguments as AllHubs;
        return _materialRoute(settings,AllHubs(
          location: args.location,
        ));

      case '/AddHub':
        return _materialRoute(settings,AddHub());

      case '/EditHub':
        final args = settings.arguments as EditHub;
        return _materialRoute(settings,EditHub(
          id: args.id,
          name: args.name,
          desecription: args.desecription,
          lat: args.lat,
          long: args.long,
        ));

      case '/AllBicyles':
      return _materialRoute(settings,AllBicyles());

      case '/AddBicycle':
      return _materialRoute(settings,AddBicycle());

      case '/EditBicycle':
      final args = settings.arguments as EditBicycle;
      return _materialRoute(settings,EditBicycle(
        id: args.id,
        model: args.model,
        pric: args.pric,
        size: args.size,
        type: args.type,
        photo: args.photo,
      ));

      default:
        return _materialRoute(settings, OnBording());
    }
  }

  static Route<dynamic> _materialRoute(RouteSettings settings, Widget view) {
    return MaterialPageRoute(settings: settings, builder: (_) => view);
  }
}
