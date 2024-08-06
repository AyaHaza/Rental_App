import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rental_app/core/widgets_App/listTile_widget.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/string.dart';
import '../../../core/resources/style.dart';
import '../../../core/widgets_App/buttons_widget.dart';
import '../../../core/widgets_App/textField_widget.dart';
import 'buttom_nav_bar.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  int currentpageindix = 0;
  bool firstSwitchvalue = false;
  TextEditingController placeController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController formController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                // RichAttributionWidget(
                //   attributions: [
                //     TextSourceAttribution(
                //       'OpenStreetMap contributors',
                //       onTap: () =>
                //           launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                //     ),
                //   ],
                // ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.06,
                left: width * 0.028,
              ),
              child: ButtonCustom(
                2,
                width * 0.002,
                height * 0.06,
                Padding(
                  padding: EdgeInsets.zero,
                  child: const Icon(Icons.format_align_justify),
                ),
                lightGreen,
                lightGreen,
                () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.06,
                right: width * 0.028,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: ButtonCustom(
                  2,
                  width * 0.005,
                  height * 0.06,
                  const Icon(Icons.add_alert_rounded),
                  white,
                  white,
                  () {},
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.25,
                left: width * 0.028,
              ),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: ButtonCustom(
                  2,
                  width * 0.35,
                  height * 0.07,
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
              padding: EdgeInsets.only(
                top: height * 0.25,
                right: width * 0.028,
              ),
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: ButtonCustom(
                  2,
                  width * 0.0003,
                  height * 0.03,
                  const Icon(
                    Icons.gps_fixed_rounded,
                  ),
                  white,
                  white,
                  () {},
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(height * 0.02),
                margin:
                    EdgeInsets.only(top: height * 0.59, bottom: height * 0.07),
                width: width * 0.94,
                height: height * 0.2,
                decoration: BoxDecoration(
                  border: Border.all(color: darkGreenColor),
                  color: mediumGreenColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFieldCustom(() {
                      showModalBottomSheet(
                        backgroundColor: white,
                        context: context,
                        builder: (context) {
                          return ListView(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: height * 0.01,
                                  bottom: height * 0.02,
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [Divider(color: subtitleColor,thickness: 2,indent: 2,endIndent: 10,), Icon(Icons.close)],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: height * 0.01,
                                  bottom: height * 0.002,
                                  left: width * 0.04,
                                ),
                                child: const Center(
                                  child: Text(
                                    SELECTADDRESS,
                                    style: selectStyle,
                                  ),
                                ),
                              ),
                              const Divider(),
                              Padding(
                                padding: EdgeInsets.all(width * 0.02),
                                child: TextFieldCustom(
                                    () {},
                                    white,
                                    black,
                                    const Icon(Icons.gps_fixed),
                                    null,
                                    FORM,
                                    formController,
                                    TextInputType.name,
                                    1),
                              ),
                              Padding(
                                padding: EdgeInsets.all(width * 0.02),
                                child: TextFieldCustom(
                                    () {},
                                    white,
                                    black,
                                    const Icon(Icons.location_on_sharp),
                                    null,
                                    TO,
                                    toController,
                                    TextInputType.name,
                                    1),
                              ),
                              const Divider(),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.03),
                                child: const Text(
                                  RECENTPLACE,
                                  style: buttonBlackTextStyle,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.5,
                                width: width,
                                child: ListView.builder(
                                  itemCount: 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTileCustom(
                                        const Text("Office"),
                                        titelTextStyle,
                                        const Text("Office546465456"),
                                        const Icon(Icons.location_on_sharp),
                                        const Text("2.7km"),
                                        subtitleTextStyle,
                                        null);
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                        lightGreenColor,
                        lightGreen1,
                        const Icon(Icons.search),
                        const Icon(Icons.favorite_border_outlined),
                        WHEREWOULDYOUGO,
                        placeController,
                        TextInputType.name,
                        1),
                    AnimatedToggleSwitch<bool>.size(
                      animationCurve: Curves.linearToEaseOut,
                      current: firstSwitchvalue,
                      values: const [false, true],
                      indicatorSize: Size.fromWidth(width * 0.9),
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
                      selectedIconScale: height * 0.0015,
                      //onChanged: (value) => ,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            backgroundColor: darkGreenColor,
            child: const Icon(
              Icons.wallet,
              color: white,
            ),
            onPressed: () {}),
        bottomNavigationBar: const ButtomNavBar());
  }
}
