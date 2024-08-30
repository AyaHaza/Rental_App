import 'package:flutter/material.dart';
import '../../../../config/responsive.dart';
import '../../../../core/resources/color.dart';
import '../../../../core/resources/padding.dart';
import '../../../../core/resources/string.dart';
import '../../../../core/resources/style.dart';
import '../../../../core/widgets_App/buttons_widget.dart';
import '../../../../core/widgets_App/listTile_widget.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: leftAndRightAndTopPadding(0.02, 0.02, 0.04),
        child: ListView(
          children: [
            Row(
              children: [
                const Spacer(),
                Padding(
                  padding: leftAndRightAndTopPadding(0.01, 0.03,0.02),
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
              height: screenHight * 0.9,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        padding: onlyBottomPadding(0.03),
                        margin: onlyTopPadding(0.01),
                        height: screenHight * 0.07,
                        decoration: BoxDecoration(
                          border: Border.all(color: lightGreen),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTileCustom(
                            // true,
                            const Text(
                              "15% off",
                            ),
                            pofferTextStyle,
                            const Text("Haapy New year"),
                            null,
                            ButtonCustom(1, screenWidth * 0.2, screenHight * 0.08,
                                Text(COLLECT,style: collectTextStyle), darkGreenColor, darkGreenColor, () {}),
                            subtitleTextStyle,
                            null),
                      ),
                    ],
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
