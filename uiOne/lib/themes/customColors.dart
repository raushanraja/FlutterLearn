import 'package:flutter/material.dart';

class CustomColors {
  // This class is not meant to be instatiated or extended; this constructor
  // prevents instantiation and extension.
  // ignore: unused_element
  CustomColors._();

  static const MaterialColor primary = MaterialColor(
    _primaryPrimaryValue,
    <int, Color>{
      50: Color(0xFFD6E4FF),
      100: Color(0xFFD6E4FF),
      200: Color(0xFFADC8FF),
      300: Color(0xFF84A9FF),
      400: Color(0xFF6690FF),
      500: Color(0xFF3366FF),
      600: Color(0xFF254EDB),
      700: Color(0xFF1939B7),
      800: Color(0xFF102693),
      900: Color(0xFF091A7A)
    },
  );

  static const int _primaryPrimaryValue = 0xFF3366FF;

  static const primaryTransparent = {
    100: Color.fromRGBO(51, 102, 255, 0.08),
    200: Color.fromRGBO(51, 102, 255, 0.16),
    300: Color.fromRGBO(51, 102, 255, 0.24),
    400: Color.fromRGBO(51, 102, 255, 0.32),
    500: Color.fromRGBO(51, 102, 255, 0.4),
    600: Color.fromRGBO(51, 102, 255, 0.48)
  };

  static const MaterialColor success = MaterialColor(
    _successPrimaryValue,
    <int, Color>{
      50: Color(0xFFEEFDD2),
      100: Color(0xFFEEFDD2),
      200: Color(0xFFD9FBA7),
      300: Color(0xFFBBF379),
      400: Color(0xFF9DE756),
      500: Color(0xFF72D824),
      600: Color(0xFF56B91A),
      700: Color(0xFF3E9B12),
      800: Color(0xFF297D0B),
      900: Color(0xFF1B6706),
    },
  );
  static const int _successPrimaryValue = 0xFF72D824;

  static const successTransparent = {
    100: Color.fromRGBO(114, 216, 36, 0.08),
    200: Color.fromRGBO(114, 216, 36, 0.16),
    300: Color.fromRGBO(114, 216, 36, 0.24),
    400: Color.fromRGBO(114, 216, 36, 0.32),
    500: Color.fromRGBO(114, 216, 36, 0.4),
    600: Color.fromRGBO(114, 216, 36, 0.48)
  };

  static const MaterialColor info = MaterialColor(
    _infoPrimaryValue,
    <int, Color>{
      50: Color(0xFFD9F1FE),
      100: Color(0xFFD9F1FE),
      200: Color(0xFFB4E0FE),
      300: Color(0xFF8ECBFE),
      400: Color(0xFF72B7FD),
      500: Color(0xFF4497FC),
      600: Color(0xFF3175D8),
      700: Color(0xFF2257B5),
      800: Color(0xFF153C92),
      900: Color(0xFF0D2A78),
    },
  );
  static const int _infoPrimaryValue = 0xFF4497FC;

  static const infoTransparent = {
    100: Color.fromRGBO(68, 151, 252, 0.08),
    200: Color.fromRGBO(68, 151, 252, 0.16),
    300: Color.fromRGBO(68, 151, 252, 0.24),
    400: Color.fromRGBO(68, 151, 252, 0.32),
    500: Color.fromRGBO(68, 151, 252, 0.4),
    600: Color.fromRGBO(68, 151, 252, 0.48)
  };

  static const MaterialColor warning = MaterialColor(
    _warningPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFF7CC),
      100: Color(0xFFFFF7CC),
      200: Color(0xFFFFEC99),
      300: Color(0xFFFFDE67),
      400: Color(0xFFFFD141),
      500: Color(0xFFFFBB02),
      600: Color(0xFFDB9A01),
      700: Color(0xFFB77C01),
      800: Color(0xFF936000),
      900: Color(0xFF7A4C00),
    },
  );
  static const int _warningPrimaryValue = 0xFFFFBB02;

  static const warningTransparent = {
    100: Color.fromRGBO(255, 187, 2, 0.08),
    200: Color.fromRGBO(255, 187, 2, 0.16),
    300: Color.fromRGBO(255, 187, 2, 0.24),
    400: Color.fromRGBO(255, 187, 2, 0.32),
    500: Color.fromRGBO(255, 187, 2, 0.4),
    600: Color.fromRGBO(255, 187, 2, 0.48)
  };

  static const MaterialColor danger = MaterialColor(
    _dangerPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFE9D2),
      100: Color(0xFFFFE9D2),
      200: Color(0xFFFFCCA6),
      300: Color(0xFFFFAA79),
      400: Color(0xFFFF8858),
      500: Color(0xFFFF5121),
      600: Color(0xFFDB3418),
      700: Color(0xFFB71C10),
      800: Color(0xFF930A0A),
      900: Color(0xFF7A060F),
    },
  );
  static const int _dangerPrimaryValue = 0xFFFF5121;

  static const dangerTransparent = {
    100: Color.fromRGBO(255, 81, 33, 0.08),
    200: Color.fromRGBO(255, 81, 33, 0.16),
    300: Color.fromRGBO(255, 81, 33, 0.24),
    400: Color.fromRGBO(255, 81, 33, 0.32),
    500: Color.fromRGBO(255, 81, 33, 0.4),
    600: Color.fromRGBO(255, 81, 33, 0.48)
  };

  static const WhiteBackgrounds = [
    Color(0xFFFFFFFF),
    Color(0xFFEFEFEF),
    Color(0xFFEEEDED),
    Color(0xFFE8F1F8),
    Color(0xFFF5FAFA),
    Color(0xFFF0F4FF),
    Color(0xFFE0E4EE),
    Color(0xFFEEECF6),
    Color(0xFFF3F3FD),
    Color(0xFFD6D6F6),
  ];
  static const BlackBackgrounds = [
    Color(0xff242c40)
  ];
}