import 'package:flutter/material.dart';
import '../core/widgets_App/botton_navigation.dart';
import '../features/about_us/presentaion_layer/view/about_us.dart';
import '../features/authentication/presentation_layer/view/login.dart';
import '../features/authentication/presentation_layer/view/register.dart';
import '../features/authentication/presentation_layer/view/set_password.dart';
import '../features/authentication/presentation_layer/view/welcome.dart';
import '../features/bicycle_mangement/presentation_layer/view/add_bicycles.dart';
import '../features/bicycle_mangement/presentation_layer/view/all_bicyles.dart';
import '../features/bicycle_mangement/presentation_layer/view/edit_bicycle.dart';
import '../features/helpAndSupport/presentation_layer/view/help_and_support.dart';
import '../features/history/presentation_layer/view/history.dart';
import '../features/map/presentation_layer/view/add_hub.dart';
import '../features/map/presentation_layer/view/all_hubs.dart';
import '../features/map/presentation_layer/view/edit_hub.dart';
import '../features/map/presentation_layer/view/map.dart';
import '../features/map/presentation_layer/view/search_hub.dart';
import '../features/reservation/presentation_layer/view/hub_content.dart';
import '../features/reservation/presentation_layer/view/select_avaialble_transport.dart';
import '../features/reservation/presentation_layer/view/select_transport.dart';
import '../features/reservation/presentation_layer/view/transport_detail.dart';
import '../features/wallet/presentaion_layer/view/wallet_info_and_code.dart';


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

      case '/MapScreen':
        return _materialRoute(settings,MapScreen());

      case '/ButtomNavBar':
        return _materialRoute(settings,ButtomNavBar());

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

      case '/History':
        return _materialRoute(settings,History());

      //
      // case '/Setting':
      //   return _materialRoute(settings, const SettingScreen());
      //
      // case '/ChangePassword':
      //   return _materialRoute(settings, const Changepassword());
      //
      // case '/Changelanguage':
      //   return _materialRoute(settings, const Changelanguage());
      //
      // case '/PolicyScreen':
      //   return _materialRoute(settings, const PolicyScreen());
      //
      // case '/ContactusScreen':
      //   return _materialRoute(settings, const ContactusScreen());
      //
      // case '/DeleteaccountScreen':
      //   return _materialRoute(settings, const DeleteaccountScreen());
      //
      case '/HelpAndSupport':
        return _materialRoute(settings,  HelpAndSupport());

      case '/AboutusScreen':
        return _materialRoute(settings,  AboutusScreen());

      case '/WalletInfoAndCode':
        return _materialRoute(settings,  WalletInfoAndCode());


      default:
        return _materialRoute( settings,Welcome());
    }
  }

  static Route<dynamic> _materialRoute(RouteSettings settings,Widget view) {
    return MaterialPageRoute(settings: settings,builder: (_) => view);
  }
}