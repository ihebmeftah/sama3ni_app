import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

abstract class AppThemes {
  AppThemes._();
  static get gradientV1 => LinearGradient(
        colors: [
          HexColor("#000000"),
          HexColor("130F40"),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Raleway",
  );
  static final ThemeData dark = ThemeData(
    fontFamily: "Raleway",
    brightness: Brightness.dark,
    tabBarTheme: const TabBarTheme(dividerHeight: 0),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: false,
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: Colors.blue.shade400,
      inactiveTrackColor: Colors.grey.shade300,
      trackHeight: 2,
      thumbColor: Colors.blue.shade400,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 15.0),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(300, 40),
            backgroundColor: Colors.blue.shade800,
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ))),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    ),
    expansionTileTheme: ExpansionTileThemeData(
      collapsedBackgroundColor: HexColor("#25262B"),
      backgroundColor: HexColor("#25262B"),
      childrenPadding: const EdgeInsets.all(8),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
      overlayColor: Colors.grey.shade200,
      foregroundColor: Colors.blue.shade900,
    )),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(fontSize: (13), fontWeight: FontWeight.w400),
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
    ),
  );
}
