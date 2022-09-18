import 'package:flutter/material.dart';
Widget TitleWidget(double sizedofbox){
  return Row(
    children: [
      SizedBox(width: sizedofbox,),
      const Text(
        'Wallpaper',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      const Text(
        'Hub',
        style: TextStyle(
          color: Colors.cyan,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
  }