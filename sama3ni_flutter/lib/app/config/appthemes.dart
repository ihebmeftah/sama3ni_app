import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.black,
    ),
    chipTheme: const ChipThemeData(
        backgroundColor: Colors.black,
        labelStyle: TextStyle(color: Colors.white)),
    checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((v) {
          return Colors.white;
        }),
        checkColor:
            WidgetStateProperty.resolveWith((v) => Colors.blue.shade900)),
    popupMenuTheme: PopupMenuThemeData(
        iconColor: Colors.grey.shade400,
        textStyle: TextStyle(
          color: Colors.grey.shade400,
        ),
        labelTextStyle: WidgetStateProperty.resolveWith((v) { 
          return TextStyle(
            color: Colors.grey.shade400,
          );
        }),
        color: Colors.black),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.grey.shade400),
      centerTitle: false,
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      foregroundColor: Colors.blue,
    )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      selectedItemColor: Colors.grey.shade300,
      unselectedItemColor: Colors.grey.shade400,
      selectedLabelStyle: const TextStyle(
        fontSize: 14.5,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
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
            fixedSize: Size(300, GetPlatform.isWeb ? 40 : 47),
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
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: HexColor("8193b2"),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      filled: true,
      errorStyle: const TextStyle(color: Colors.red),
      fillColor: HexColor("#0c162d"),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade400, width: 0.8),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade400, width: 0.8),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
        color: Colors.red,
      )),
      errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
        color: Colors.red,
      )),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.blue),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
      overlayColor: Colors.grey.shade200,
      foregroundColor: Colors.grey.shade400,
    )),
  );
}
