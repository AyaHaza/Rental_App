import 'package:flutter/material.dart';
import '../../../config/responsive.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/string.dart';
import '../../../core/resources/style.dart';
import '../../../core/widgets_App/listTile_widget.dart';
import '../../../core/widgets_App/textField_widget.dart';

void bottomSheetCustom(context,formController,toController){
  showModalBottomSheet(
    backgroundColor: white,
    context: context,
    builder: (context) {
      return ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenHight * 0.01,
              bottom: screenHight * 0.02,
            ),
            child: const Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [Divider(color: subtitleColor,thickness: 2,indent: 2,endIndent: 10,), Icon(Icons.close)],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenHight * 0.01,
              bottom: screenHight * 0.002,
              left: screenWidth * 0.04,
            ),
            child: const Center(
              child: Text(
                SELECTADDRESS,
                style: selectStyle,
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: TextFieldCustom(

                white,
                // black,
                const Icon(Icons.gps_fixed),
                SizedBox(),
                FORM,
                formController,
                TextInputType.name,1,
                    (v){},
                    () {},false
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: TextFieldCustom(
                white,
                // black,
                const Icon(Icons.location_on_sharp),
                SizedBox(),
                TO,
                toController,
                TextInputType.name,1,
                    (v){},
                    () {},false
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.03),
            child: const Text(
              RECENTPLACE,
              style: buttonBlackTextStyle,
            ),
          ),
          SizedBox(
            height: screenHight * 0.5,
            width: screenWidth,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder:
                  (BuildContext context, int index) {
                return ListTileCustom(
                    const Text("Office"),
                    titelTextStyle,
                    const Text("Office546465456"),
                    const Icon(Icons.location_on_sharp),
                    const Text("2.7km"),
                    subtitleTextStyle,
                    null);
              },
            ),
          ),
        ],
      );
    },
  );
}