import 'package:flutter/material.dart';

abstract class AppColors{
  static const Color lightRed = Color(0xFFFF605D);
  static const Color pink = Color(0xFFFD527B);
  static const Color purple = Color(0xFFBB4ABF);
  static const Color blue = Color(0xFF675ED8);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xFFD00416);
  static const Color transparent = Colors.transparent;

  static const Color lightBackground = Color(0xFFF9F9F9);
  static const Color hintColor = Color(0xFF808080);
  static const Color secondaryDarkCardColor = Color(0xFF333333);
  static const Color dividerColor = Color(0xFFE6E6E6);
  static const Color dividerColorDark = Color(0xFFE6E6E6);
  static const Color lightGray = Color(0xFFCCCCCC);
  static const Color darkGray = Color(0xFF6B7280);


  static const Color darkCardColor = Color(0xFF1A1A1A);
  static const Color morningYello = Color(0xFFDFB400);
  static const Color noonOrange = Color(0xFFD77A1D);
  static const Color eveningBlue = Color(0xFF1D58D7);
  static const Color nightGray = Color(0xFF666666);
  static const Color green = Color(0xFF1FC16B);

  static LinearGradient get primaryGradient => const LinearGradient(
      colors: [
        lightRed,
        pink,     
        purple,   
        blue,     
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
}