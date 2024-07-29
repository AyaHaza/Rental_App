import 'package:flutter/material.dart';
import 'config/responsive_init_point/responsive.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initResponsive(context);
    return MaterialApp(
      title: 'Flutter Demo',
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if(isWeb)
            Container(
              color: Colors.orangeAccent,
              width: 200,
              child: Center(child: Text("drawer web"),),
            ),
          Center(
            child: Text(
              "$screenHight, ,  $screenWidth"
            ),
          ),
        ],
      ),
    );
  }
}
