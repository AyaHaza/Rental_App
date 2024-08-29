import 'package:flutter/material.dart';
import '../../../config/responsive.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/padding.dart';
import '../../../core/resources/string.dart';
import '../../../core/resources/style.dart';
import '../../../core/widgets_App/buttons_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: leftAndRightAndTopPadding(0.03, 0.03,0.02),
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                const Text(back),
                Padding(
                  padding: onlyLeftPadding(0.2),
                  child: const Text(SETTING,style: titel,),
                ),
              ],
            ),
            
            Padding(
              padding: TopAndBottomPadding(0.02, 0.02),
              child: ButtonCustom(
                  0,
                  screenWidth,
                  screenHight * 0.065,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(CHANGEPASSWORD,style: TextStyle(color: black),),
                      Icon(Icons.arrow_forward_ios_rounded,color: black,)
                    ],
                  ),
                  white,
                  lightGreen,
                  () {Navigator.pushNamed(context, '/ChangePassword');}),
            ),
            ButtonCustom(
                0,
                screenWidth,
                screenHight * 0.065,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(CAHNGELANGUAGE,style: TextStyle(color: black),),
                    Icon(Icons.arrow_forward_ios_rounded,color: black,)
                  ],
                ),
                white,
                lightGreen,
                () {Navigator.pushNamed(context, '/Changelanguage');}),
            Padding(
              padding: TopAndBottomPadding(0.02, 0.02),
              child: ButtonCustom(
                  0,
                  screenWidth,
                  screenHight * 0.065,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(privacyPolicy,style: TextStyle(color: black),),
                      Icon(Icons.arrow_forward_ios_rounded,color: black,)
                    ],
                  ),
                  white,
                  lightGreen,
                  () {Navigator.pushNamed(context,'/PolicyScreen');}),
            ),
            ButtonCustom(
                0,
                screenWidth,
                screenHight * 0.065,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(CONTACTUS,style: TextStyle(color: black),),
                    Icon(Icons.arrow_forward_ios_rounded,color: black,)
                  ],
                ),
                white,
                lightGreen,
                () {Navigator.pushNamed(context,'/ContactusScreen');}),
            Padding(
              padding: onlyTopPadding(0.02),
              child: ButtonCustom(
                  0,
                  screenWidth,
                  screenHight * 0.065,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DELETACCOUNT,style: TextStyle(color: black),),
                      Icon(Icons.arrow_forward_ios_rounded,color: black,)
                    ],
                  ),
                  white,
                  lightGreen,
                  () {Navigator.pushNamed(context,'/DeleteaccountScreen');}),
            )
          ],
        ),
      ),
    );
  }
}
