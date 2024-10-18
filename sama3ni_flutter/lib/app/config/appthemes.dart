import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

abstract class AppThemes {
  AppThemes._();

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Raleway",
  );
  static final ThemeData dark = ThemeData(
      fontFamily: "Raleway",
      brightness: Brightness.dark,
      scaffoldBackgroundColor: HexColor("#000000"),
      appBarTheme: AppBarTheme(
        backgroundColor: HexColor("#000000"),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(fontSize: (11.2).sp, fontWeight: FontWeight.w400),
        hoverColor: Colors.transparent,
        fillColor: HexColor("#383838"),
        constraints: const BoxConstraints(
          maxHeight: 40,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade800),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            )),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade800),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade800),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ));
}
