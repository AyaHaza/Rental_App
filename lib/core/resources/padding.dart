
import 'package:flutter/material.dart';
import '../../config/responsive.dart';

EdgeInsetsGeometry onlyTopPadding(topPadding){
  return EdgeInsets.only(top: screenHight*topPadding);
}

EdgeInsetsGeometry onlyBottomPadding(bottomPadding){
  return EdgeInsets.only(bottom: screenHight*bottomPadding);
}

EdgeInsetsGeometry onlyLeftPadding(leftPadding){
  return EdgeInsets.only(left: screenWidth*leftPadding);
}

EdgeInsetsGeometry onlyRightPadding(rightPadding){
  return EdgeInsets.only(right: screenWidth*rightPadding);
}

EdgeInsetsGeometry leftAndRightPadding(leftPadding,rightPadding){
  return EdgeInsets.only(left: screenWidth*leftPadding,right: screenWidth*rightPadding);
}

EdgeInsetsGeometry leftAndBottomPadding(leftPadding,bottomPadding){
  return EdgeInsets.only(left: screenWidth*leftPadding,bottom: screenHight*bottomPadding);
}

EdgeInsetsGeometry leftAndTopPadding(leftPadding,topPadding){
  return EdgeInsets.only(left: screenWidth*leftPadding,top: screenHight*topPadding);
}

EdgeInsetsGeometry leftAndRightAndTopPadding(leftPadding,rightPadding,topPadding){
  return EdgeInsets.only(left: screenWidth*leftPadding,right: screenWidth*rightPadding,top: screenHight*topPadding);
}

EdgeInsetsGeometry leftAndRightAndTBottomPadding(leftPadding,rightPadding,bottomPadding){
  return EdgeInsets.only(left: screenWidth*leftPadding,right: screenWidth*rightPadding,bottom: screenHight*bottomPadding);
}

EdgeInsetsGeometry leftAndTopAndTBottomPadding(leftPadding,topPadding,bottomPadding){
  return EdgeInsets.only(left: screenWidth*leftPadding,top: screenHight*topPadding,bottom: screenHight*bottomPadding);
}

EdgeInsetsGeometry rightAndBottomPadding(rightPadding,bottomPadding){
  return EdgeInsets.only(right: screenWidth*rightPadding,bottom: screenHight*bottomPadding);
}

EdgeInsetsGeometry rightAndTopPadding(rightPadding,topPadding){
  return EdgeInsets.only(right: screenWidth*rightPadding,top: screenHight*topPadding);
}

EdgeInsetsGeometry rightAndTopAndTBottomPadding(rightPadding,topPadding,bottomPadding){
  return EdgeInsets.only(right: screenWidth*rightPadding,top: screenHight*topPadding,bottom: screenHight*bottomPadding);
}

EdgeInsetsGeometry topAndBottomPadding(topPadding,bottomPadding){
  return EdgeInsets.only(top: screenHight*topPadding,bottom: screenHight*bottomPadding);
}

EdgeInsetsGeometry leftAndRightAndTopAndTBottomPadding(leftPadding,rightPadding,topPadding,bottomPadding){
  return EdgeInsets.only(left: screenWidth*leftPadding,right: screenWidth*rightPadding,top: screenHight*topPadding,bottom: screenHight*bottomPadding);
}


