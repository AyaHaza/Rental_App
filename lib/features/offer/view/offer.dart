import 'package:flutter/material.dart';
import 'package:rental_app/core/widgets_App/buttons_widget.dart';

import '../../../config/hive_config.dart';
import '../../../config/responsive.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/padding.dart';
import '../../../core/resources/string.dart';
import '../../../core/resources/style.dart';
import '../../../core/resources/variable.dart';
import '../../../core/widgets_App/drawer_widget.dart';
import '../../../core/widgets_App/listTile_widget.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
              const AssetImage(boyImage),
              () {},
              () {},
              () {},
              () {},
              () {},
              () {}, () async {
              userHive!.delete("token");
              Navigator.pushNamed(context, '/Register');
            }),
      body: Padding(
        padding: leftAndRightAndTopPadding(0.02, 0.02, 0.04),
        child: ListView(
          children: [
            Row(
              children: [
                Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: lightGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(
                        Icons.format_align_justify,
                        size: 18,
                        color: black,
                      ),
                    );
                  },
                ),
                const Spacer(),
                Padding(
                  padding: leftAndRightPadding(0.01, 0.03),
                  child: const Text(
                    OFFER,
                    style: titel,
                  ),
                ),
                const Spacer(),
              ],
            ),
            Container(
              margin: onlyTopPadding(0.024),
              width: double.infinity,
              height: screenHight * 0.783,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: TopAndBottomPadding(0.015, 0.015),
                    height: screenHight * 0.09,
                    decoration: BoxDecoration(
                      border: Border.all(color: lightGreen),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTileCustom(
                        true,
                        const Text(
                          "15% off",
                        ),
                        pofferTextStyle,
                        const Text("Haapy New year"),
                        null,
                        ButtonCustom(1, screenWidth * 0.25, screenHight * 0.08,
                            Text(COLLECT,style: collectTextStyle), darkGreenColor, darkGreenColor, () {}),
                        subtitleTextStyle,
                        null),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
