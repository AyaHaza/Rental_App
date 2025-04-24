import 'package:flutter/material.dart';

import '../../../../core/resources/color.dart';
import '../../../../core/resources/padding.dart';
import '../../../../core/resources/string.dart';
import '../../../../core/resources/style.dart';


class Changelanguage extends StatelessWidget {
  const Changelanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: leftAndRightAndTopPadding(0.03, 0.03, 0.02),
        child: ListView(
          children: [
            Row(children: [
              IconButton(
                  onPressed: () {Navigator.pop(context);},
                  icon: const Icon(Icons.arrow_back_ios)
              ),
              const Text(back),

            ],),
            Padding(
              padding: leftAndTopPadding(0.26,0.02),
              child: const Text(
                CAHNGELANGUAGE,
                style: titel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}