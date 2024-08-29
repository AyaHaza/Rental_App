import 'package:flutter/material.dart';
import 'package:rental_app/core/resources/color.dart';

import '../../../core/resources/padding.dart';
import '../../../core/resources/string.dart';
import '../../../core/resources/style.dart';

class Changelanguage extends StatelessWidget {
  const Changelanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: white,body: ListView(children: [Row(children: [IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                        const Text(back),
                        Padding(
                          padding: onlyLeftPadding(0.1),
                          child: const Text(
                            CAHNGELANGUAGE,
                            style: titel,
                          ),
                        ),],)],),);
  }
}