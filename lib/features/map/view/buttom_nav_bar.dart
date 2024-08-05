import 'package:flutter/material.dart';

import '../../../core/resources/color.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({super.key});

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => _onItemTapped(0),
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.home,
                  color: _selectedIndex == 0 ? lightGreen3 : black,
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 12,
                    color: _selectedIndex == 0 ? lightGreen3 : titelColor,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _onItemTapped(1),
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.favorite_outline,
                  color: _selectedIndex == 1 ? lightGreen3 : titelColor,
                ),
                Text(
                  'Favorite',
                  style: TextStyle(
                    fontSize: 12,
                    color: _selectedIndex == 1 ? lightGreen3 : titelColor,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _onItemTapped(2),
            icon: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add,
                  color: white,
                ),
                Text(
                  'Wallet',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _onItemTapped(3),
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.verified_outlined,
                  color: _selectedIndex == 3 ? lightGreen3 : titelColor,
                ),
                Text(
                  'Offer',
                  style: TextStyle(
                    fontSize: 12,
                    color: _selectedIndex == 3 ? lightGreen3 : titelColor,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _onItemTapped(4),
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person,
                  color: _selectedIndex == 4 ? lightGreen3 : titelColor,
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 12,
                    color: _selectedIndex == 4 ? lightGreen3 : titelColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
