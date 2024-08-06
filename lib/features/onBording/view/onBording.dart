// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:rental_app/main.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/string.dart';
import '../../../core/resources/style.dart';

PageController onBordingController = PageController();

class OnBording extends StatelessWidget {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: onBordingController,
          //physics: const NeverScrollableScrollPhysics(),
          children: const [
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

class OnBordingScreen extends StatelessWidget {
  // ignore: use_super_parameters
  const OnBordingScreen({
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
          //crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(flex: 1),
            const Flexible(
              flex: 2,
              child: Padding(
                  padding: EdgeInsets.only(left: 300),
                  child: Text(SKIP, style: skipTextStyle)),
            ),
            const Spacer(flex: 2),
            Flexible(
              flex: 7,
              child: Image.asset(
                image,
              ),
            ),
            const Spacer(),
            Flexible(
              flex: 3,
              child: Text(titel, style: onBordingTitelTextStyle),
            ),
            Flexible(
              flex: 2,
              child: Text(subTitel, style: onBordingSubTitleTextStyle),
            ),
            const Spacer(
              flex: 6,
            ),
            Flexible(
              flex: 3,
              child: InkWell(
                onTap: () {
                  if (index > 2) {
                    Navigator.pushNamed(context, '/MapPage');
                  } else {
                    onBordingController.nextPage(
                        duration: const Duration(seconds: 2),
                        curve: Curves.bounceIn);
                  }
                },
                child: Image.asset(subimage),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
