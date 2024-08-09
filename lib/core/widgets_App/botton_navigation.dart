import 'package:flutter/material.dart';
import '../../../core/resources/variable.dart';
import '../../config/responsive.dart';
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
          BottomNavigationBarItem(icon: SizedBox(height: screenHight*0.03,),label: wallet),
          BottomNavigationBarItem(icon: Icon(Icons.verified_outlined),label: offer),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: profile),
        ],
        onTap: (index){
          setState(() {
            crrentIndex=index;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: darkGreenColor,
          child: const Icon(Icons.wallet, color: white,), onPressed: () {}
      ),
    );
  }
}
