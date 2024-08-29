import 'package:flutter/material.dart';
import '../../../core/resources/variable.dart';
import '../resources/color.dart';
import '../resources/string.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({super.key});

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body:tabs[crrentIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: crrentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: white,
        selectedItemColor: darkGreenColor,
        unselectedItemColor: subtitleColor,
        iconSize: 18,
        selectedFontSize: 12,
        items: [  
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: home,),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: favorite),
          BottomNavigationBarItem(icon: Icon(Icons.wallet),label: wallet),
          BottomNavigationBarItem(icon: Icon(Icons.verified_outlined),label: offer),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: profile),
        ],
        onTap: (index){
          setState(() {
            crrentIndex=index;
          });
        },
      ),
     );
  }
}
