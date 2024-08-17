import 'package:flutter/material.dart';
import '../core/widgets_App/botton_navigation.dart';
import '../features/authentication/presentation_layer/view/login.dart';
import '../features/authentication/presentation_layer/view/register.dart';
import '../features/authentication/presentation_layer/view/set_password.dart';
import '../features/authentication/presentation_layer/view/welcome.dart';
import '../features/map/presentation_layer/view/map.dart';
import '../features/reservation/presentation_layer/view/hub_content.dart';
import '../features/reservation/presentation_layer/view/select_avaialble_transport.dart';
import '../features/reservation/presentation_layer/view/select_transport.dart';
import '../features/reservation/presentation_layer/view/show_or_rental4.dart';
import '../features/reservation/presentation_layer/view/transport_detail.dart';


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

      case '/MapScreen':
        return _materialRoute(settings,MapScreen());

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

      default:
        return _materialRoute( settings,Welcome());
    }
  }

  static Route<dynamic> _materialRoute(RouteSettings settings,Widget view) {
    return MaterialPageRoute(settings: settings,builder: (_) => view);
  }
}