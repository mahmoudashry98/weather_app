import 'package:flutter/material.dart';

class AppColors {
  // static MaterialColor primaryColor = Color(v);
  static Color textWhite = Colors.white;
  static Color textBlack = Colors.black;

  /// scaffold background colors
  static Color lightGrey = Colors.grey.shade100;
  static const Color black = Colors.black;
  static  Color greyLight = Colors.grey[400]!;

  static Color primaryColor = const Color(0xff84a8e6);
  static Color whiteWithOpacity = const Color.fromRGBO(
    255,
    255,
    255,
    230,
  );

  /// card colors
  static Color dividerLightGrey = Colors.grey.shade300;
  static Color dividerDarkGrey = Colors.grey.shade600;
  static Color darkGrey = Colors.grey.shade900;

  /// time of day background colors
  static const Color day = Color(0xFF7CB2F2);
  static const Color dayCard = Color(0xFF8BB9EB);
  static const Color night = Color(0xFF3D4472);
  static const Color nightCard = Color(0xFF626689);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
