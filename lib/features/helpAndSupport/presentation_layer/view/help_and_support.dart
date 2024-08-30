import 'package:flutter/material.dart';

import '../../../../core/resources/color.dart';
import '../../../../core/resources/padding.dart';
import '../../../../core/resources/string.dart';
import '../../../../core/resources/style.dart';

class HelpAndSupport extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: onlyTopPadding(0.04),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                const Text(back),

              ],
            ),
          ),
          const Text(HELPANDSUPPORT, style: titel),
          Padding(
            padding: leftAndRightAndTopPadding(0.07, 0.07, 0.03),
            child: const Text(HELPANDSUPPORTPRIVACY),
          ),
        ],
      ),
    );
  }
}
