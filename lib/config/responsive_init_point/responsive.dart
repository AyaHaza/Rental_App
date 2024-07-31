import 'package:flutter/material.dart';

late double screenWidth;
late double screenHight;
late bool isWeb;
late bool isMobail;


initResponsive(context){

   screenWidth =MediaQuery.of(context).size.width;
   screenHight = MediaQuery.of(context).size.height;

   if(MediaQuery.of(context).size.width>=600){
      isWeb=true;
      isMobail=false;
   }
   if(MediaQuery.of(context).size.width<600){
      isWeb=false;
      isMobail=true;
   }
}