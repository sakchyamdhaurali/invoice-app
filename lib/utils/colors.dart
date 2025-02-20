import 'package:flutter/material.dart';

class AppColors {
  static Color bgColor = Color(0xFFffffff);
  // static Color iconColors =Color.fromARGB(6,75,134,255);
  static const Color iconColors = Color(
    0xFF4B86FF,
  ); // Equivalent to (255, 75, 134, 255),
  static const Color drawerColor = Color(0xFF363b4d);

  static List<BoxShadow> shadows = [
    BoxShadow(
      color: Colors.white.withOpacity(0.5),
      spreadRadius: -5,
      blurRadius: 25,
      offset: Offset(-5, -5),
    ),

    BoxShadow(
      color: Colors.green.shade900.withOpacity(0.3),
      spreadRadius: 2,
      blurRadius: 20,
      // offset: Offset(7, 7),
    ),
  ];
}
