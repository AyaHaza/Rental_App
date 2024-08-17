import 'package:flutter/material.dart';
import '../../../config/responsive.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/padding.dart';
import '../../../core/resources/string.dart';
import '../../../core/widgets_App/buttons_widget.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            Padding(
              padding: leftAndRightAndTopPadding(0.02,0.02,0.02),
              child: Image.asset(welcomeImage),
            ),
            Padding(
              padding: leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.018),
              child: Center(child: Text(welcome,style: TextStyle(fontSize:30 ,fontWeight: FontWeight.w500),),),
            ),
            Center(child: Text(haveABetterSharingExperience,style: TextStyle(fontSize:20 ,color: subtitleColor),),),
            SizedBox(height: screenHight*0.32,),
            Padding(
              padding: leftAndRightAndTBottomPadding(0.02,0.02,0.02),
              child: ButtonCustom(0,0, screenHight*0.06,Text(createAnAccount,style: TextStyle(color: white,fontSize: 18),), darkGreenColor, darkGreenColor, (){Navigator.pushNamed(context, '/Register');}),
            ),
            Padding(
              padding: leftAndRightAndTBottomPadding(0.02,0.02,0.02),
              child: ButtonCustom(0,0, screenHight*0.06,Text(login,style: TextStyle(color: darkGreenColor,fontSize: 18),), white, darkGreenColor, (){Navigator.pushNamed(context, '/Login');}),
            ),
          ]
        ),
      ),
    );
  }
}
