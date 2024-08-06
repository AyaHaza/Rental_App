import 'package:flutter/material.dart';
import 'package:rental_app/core/resources/color.dart';
import 'config/responsive_init_point/responsive.dart';
import 'config/routes/app_routes.dart';
import 'core/resources/assets.dart';
import 'core/resources/string.dart';
import 'core/widgets_App/drawer_widget.dart';
import 'features/map/view/map.dart';
import 'features/onBording/view/onBording.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: Map(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     initResponsive(context);
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home:  MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: white,
      
//       appBar: (isMobail)?AppBar(backgroundColor: white,):PreferredSize(preferredSize: Size(0, 0),
//       child:SizedBox(),),
//       drawer: DrawerCustom("Nate Samson","nate@email.con",(){},(){},(){},(){},(){},(){},(){}),
//       body: Row(
//         children: [
//           if(isWeb)
//             Container(
//               width: 200,
//               child:  DrawerCustom("Nate Samson","nate@email.con",(){},(){},(){},(){},(){},(){},(){}),
//             ),
//           // Center(
//           //   child: Text(
//           //     "$screenHight, ,  $screenWidth"
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

