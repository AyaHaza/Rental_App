import 'package:flutter/material.dart';
import '../config/hive_config.dart';
import '../core/resources/assets.dart';
import '../core/resources/color.dart';
import '../core/resources/variable.dart';
import '../core/widgets_App/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          backgroundColor: white,
          appBar: AppBar (),
          drawer:(isGoogle==true)? DrawerCustom(user.currentUser!.displayName!,user.currentUser!.email,NetworkImage(user.currentUser!.photoUrl),(){},(){},(){},(){},(){},(){},()async{ userHive!.delete("token");if(isGoogle==true){await user.disconnect();};Navigator.pushNamed(context, '/Register'); }):
          DrawerCustom('user Name','userEmail@gmail.com',AssetImage(boyImage),(){},(){},(){},(){},(){},(){},()async{ userHive!.delete("token");Navigator.pushNamed(context, '/Register'); }),

        );
      }
    );
  }
}
