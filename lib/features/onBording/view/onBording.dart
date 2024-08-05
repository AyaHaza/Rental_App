import 'package:flutter/material.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/padding.dart';
import '../../../core/resources/string.dart';
import '../../../core/resources/style.dart';

PageController onBordingController = PageController();

class OnBording extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: onBordingController,
          //physics: const NeverScrollableScrollPhysics(),
          children:  [
            OnBordingScreen(
              image: onbordingImage1,
              titel: ANYWHEREYOUARE,
              subTitel: SELLHOUSESEASILY,
              subimage: indexOnbordingImage1,
              index: 0,
            ),
            OnBordingScreen(
              image: onbordingImage2,
              titel: ATANYTIME,
              subTitel: SELLHOUSESEASILY,
              subimage: indexOnbordingImage2,
              index: 1,
            ),
            OnBordingScreen(
              image: onbordingImage3,
              titel: BOOKYOURCAR,
              subTitel: SELLHOUSESEASILY,
              subimage: indexOnbordingImage3,
              index: 2,
            ),
          ],
        ),
      ),
    );
  }
}
final ValueNotifier valueNotifier=ValueNotifier(0.0);

class OnBordingScreen extends StatelessWidget {
  // ignore: use_super_parameters
   OnBordingScreen({
    Key? key,
    required this.image,
    required this.titel,
    required this.subTitel,
    required this.subimage,
    required this.index,
  }) : super(key: key);
  final String image;
  final String titel;
  final String subTitel;
  final String subimage;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:  double.infinity,
        width:  double.infinity,
        child: ListView(
          children: [
            Padding(
              padding: rightAndTopPadding(0.02, 0.04),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(child: Text(SKIP, style: skipTextStyle),onPressed: (){Navigator.pushNamed(context, '/Welcome');}),
              ),
            ),
            Padding(
              padding: leftAndRightAndTopPadding(0.02, 0.02, 0.04),
              child: Image.asset(image,),
            ),
            Padding(
              padding: onlyTopPadding(0.04),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(titel, style: onBordingTitelTextStyle)
              ),
            ),
            Padding(
              padding: onlyTopPadding(0.02),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(subTitel, style: onBordingSubTitleTextStyle)
              ),
            ),
            Padding(
              padding: onlyTopPadding(0.26),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ValueListenableBuilder(
                    valueListenable: valueNotifier,
                    builder: (context,value,child) {
                      return SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: CircularProgressIndicator(
                          backgroundColor: subtitleColor,
                          color: darkGreenColor,
                          strokeWidth: 5,
                          value: value
                        ),
                      );}
                  ),
                  Center(
                    child: IconButton(icon: Icon(Icons.arrow_circle_right_sharp,color: darkGreenColor,size: 100,),onPressed: (){ valueNotifier.value = valueNotifier.value+0.5;
                    print(index);
                      if (index >= 2) {
                      Navigator.pushReplacementNamed(context, '/Welcome');
                    } else {
                      onBordingController.nextPage(
                          duration: const Duration(microseconds: 2),
                          curve: Curves.linear);
                    }},),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
