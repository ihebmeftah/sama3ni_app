import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

abstract class Appthemes {
  Appthemes._();
  static HexColor purple = HexColor("5F55DF");
  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
      );

  static ThemeData get dark => ThemeData(
        //   scaffoldBackgroundColor: HexColor("1A1A1A"),
        brightness: Brightness.dark,
      );
}
