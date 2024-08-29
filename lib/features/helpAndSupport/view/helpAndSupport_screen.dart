import 'package:flutter/material.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/padding.dart';
import '../../../core/resources/string.dart';
import '../../../core/resources/style.dart';

class HelpandsupportScreen extends StatelessWidget {
  const HelpandsupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ListView(
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
                  padding: onlyLeftPadding(0.14),
                  child: const Text(HELPANDSUPPORT, style: titel),
                ),
              ],
            ),
          ),
         
          Padding(
            padding: leftAndRightAndTopPadding(0.07, 0.07, 0.03),
            child: const Text(HELPANDSUPPORTPRIVACY),
          ),
        ],
      ),
    );
  }
}
