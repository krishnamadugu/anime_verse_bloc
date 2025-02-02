import 'package:flutter/material.dart';

class AppStyles {
  /// font family will be updated here
  static const fontFamily = "";

  /// default text style of the app
  static const TextStyle defaultTxtStyle = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
    fontFamily: fontFamily,
    overflow: TextOverflow.ellipsis,
    color: Colors.black,
    backgroundColor: Colors.transparent,
  );
}
