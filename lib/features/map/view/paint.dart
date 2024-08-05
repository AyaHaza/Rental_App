// import 'package:flutter/material.dart';

// class Paint extends StatelessWidget {
//   const Paint({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomPaint(
//         painter: TestPiant(),
//         size:Size(300, 400) ,
//       ),
//     );
//   }
// }
// class TestPiant extends CustomPainter{
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint= Paint();
    
     
//  canvas.drawLine(Offset.zero, Offset(200,0), paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }