import 'package:flutter/material.dart';
import '../../../config/responsive.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/padding.dart';
import '../../../core/resources/string.dart';
import '../../../core/widgets_App/buttons_widget.dart';
import 'hub_content.dart';
import 'select_avaialble_transport.dart';

class ShowOrRental extends StatelessWidget {
  String nameTransport;
  int hubId;
  ShowOrRental({required this.nameTransport,required this.hubId});

  @override
  Widget build(BuildContext context) {
    print(nameTransport);
    return Scaffold(
      backgroundColor: white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            Padding(
              padding:  leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.018),
              child: Row(
                children: [
                  IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios)),
                  const Text(back),
                ],
              ),
            ),
            Padding(
              padding:topAndBottomPadding(0.3,0.02),
              child: Center(child: ButtonCustom(0, screenWidth*0.76, screenHight*0.06, Text(rentalBike,style: TextStyle(color: darkGreenColor,fontSize: 20),), lightGreenColor, darkGreenColor, (){Navigator.pushNamed(context,'/HubContent',arguments: HubContent(
                nameTransport:nameTransport,
                hubId: hubId,
              ),);})),
            ),
            Center(
              child: ButtonCustom(0, screenWidth*0.76, screenHight*0.06, Text(showBikeList,style: TextStyle(color: darkGreenColor,fontSize: 20)), lightGreenColor, darkGreenColor, (){Navigator.pushNamed(context, '/SlectAvailableTransport',arguments: SlectAvailableTransport(
                nameTransport:nameTransport,
              ));}),
            )
          ],
        ),
      ),
    );
  }
}
