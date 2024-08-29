import 'package:flutter/material.dart';
import 'package:rental_app/config/responsive.dart';

import '../../../config/hive_config.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/padding.dart';
import '../../../core/resources/string.dart';
import '../../../core/resources/style.dart';
import '../../../core/widgets_App/buttons_widget.dart';

class DeleteaccountScreen extends StatelessWidget {
  const DeleteaccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: 
      ListView(
        children: [
          Padding(
            padding: onlyTopPadding(0.02),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                const Text(back),
                Padding(
                  padding: onlyLeftPadding(0.17),
                  child: const Text(PRAVACYPOLICY, style: titel),
                ),
              ],
            ),
          ),
          Padding(
            padding: leftAndRightAndTopPadding(0.07, 0.07, 0.03),
            child: const Text(PRIVACYDELETE),
          ),
          Padding(
            padding: leftAndRightAndTopPadding(0.07, 0.07, 0.07),
            child: ButtonCustom(
                0,
                screenWidth,
                screenHight * 0.06,
                const Text(DELETE,
                    style: TextStyle(color: white, fontSize: 18)),
                darkRedColor,
                darkRedColor, () {
              userHive!.clear();
              Navigator.pushNamed(context, '/Login');
            }),
          )
        ],
      ),
   
    );
  }
}
