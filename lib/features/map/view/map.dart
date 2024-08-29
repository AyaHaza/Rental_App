import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../config/hive_config.dart';
import '../../../config/responsive.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/padding.dart';
import '../../../core/resources/string.dart';
import '../../../core/resources/style.dart';
import '../../../core/resources/variable.dart';
import '../../../core/widgets_App/buttons_widget.dart';
import '../../../core/widgets_App/drawer_widget.dart';
import '../../../core/widgets_App/textField_widget.dart';
import '../widgets/bootm_sheet.dart';

class MapScreen extends StatelessWidget {
  int currentpageindix = 0;
  bool firstSwitchvalue = false;
  TextEditingController placeController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController formController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: (isGoogle == true)
          ? DrawerCustom(
              user.currentUser!.displayName!,
              user.currentUser!.email,
              NetworkImage(user.currentUser!.photoUrl),
              () {},
              () {},
              () {},
              () {},
              () {},
              () {}, () async {
              userHive!.delete("token");
              if (isGoogle == true) {
                await user.disconnect();
              }
              ;
              Navigator.pushNamed(context, '/Register');
            })
          : DrawerCustom(
              'user Name',
              'userEmail@gmail.com',
              AssetImage(boyImage),
              () {},
              () {},
              () {},
              () {},
              () {},
              () {}, () async {
              userHive!.delete("token");
              Navigator.pushNamed(context, '/Register');
            }),
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(33.510414, 36.278336),
              initialZoom: 9.2,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
            ],
          ),
          Padding(
            padding: leftAndRightAndTopPadding(0.02, 0.02, 0.04),
            child: Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  style: IconButton.styleFrom(
                      backgroundColor: lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  icon: Icon(
                    Icons.format_align_justify,
                    size: 18,
                    color: black,
                  ));
            }),
          ),
          Padding(
            padding: leftAndRightAndTopPadding(0.02, 0.02, 0.04),
            child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                        backgroundColor: white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    icon: Icon(
                      Icons.notifications_none,
                      size: 18,
                      color: black,
                    ))),
          ),
          Padding(
            padding: leftAndTopPadding(0.02, 0.36),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ButtonCustom(
                2,
                screenWidth * 0.35,
                screenHight * 0.054,
                const Text(
                  RENTAL,
                  style: buttonwhiteTextStyle,
                ),
                darkGreenColor,
                darkGreenColor,
                () {},
              ),
            ),
          ),
          Padding(
            padding: rightAndTopPadding(0.02, 0.36),
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                      backgroundColor: white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  icon: Icon(
                    Icons.gps_fixed_outlined,
                    size: 18,
                    color: black,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding:
                  leftAndRightAndTopAndTBottomPadding(0.03, 0.03, 0.02, 0.02),
              margin: onlyBottomPadding(0.045),
              width: screenWidth * 0.94,
              height: screenHight * 0.2,
              decoration: BoxDecoration(
                border: Border.all(color: darkGreenColor),
                color: mediumGreenColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFieldCustom(
                      lightGreenColor,
                      const Icon(
                        Icons.favorite_border_outlined,
                        color: subtitleColor,
                      ),
                      const Icon(Icons.search),
                      WHEREWOULDYOUGO,
                      placeController,
                      TextInputType.name,
                      1,
                      (v) {}, () {
                    bottomSheetCustom(context, formController, toController);
                  }, false),
                  AnimatedToggleSwitch<bool>.size(
                    animationCurve: Curves.linearToEaseOut,
                    current: firstSwitchvalue,
                    values: const [false, true],
                    indicatorSize: Size.fromWidth(screenWidth * 0.9),
                    inactiveOpacity: 0.6,
                    customIconBuilder: (context, local, global) =>
                        Text(local.value ? "Delivery" : "Transport"),
                    style: ToggleStyle(
                      indicatorColor: darkGreenColor,
                      borderColor: lightGreenColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        const BoxShadow(
                            color: darkGreenColor,
                            blurRadius: 0.7,
                            offset: Offset(-0.1, -0.1),
                            blurStyle: BlurStyle.outer)
                      ],
                    ),
                    borderWidth: 0.2,
                    iconAnimationCurve: Curves.decelerate,
                    selectedIconScale: screenHight * 0.0015,
                    //onChanged: (value) => ,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
