import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.iconData,
    this.isSelected = false,
    required this.text,
    required this.onClick,
  });
  final IconData iconData;
  final String text;
  final bool isSelected;
  final Function() onClick;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: text != "Logout"
            ? BorderSide.none
            : BorderSide(color: Colors.grey.shade800),
        borderRadius: BorderRadius.circular(18),
      ),
      selected: isSelected,
      contentPadding: text == "Logout"
          ? const EdgeInsets.symmetric(horizontal: 12, vertical: 0)
          : null,
      selectedColor: text == "Logout" ? Colors.white : Colors.black,
      selectedTileColor: text == "Logout" ? HexColor("#171717") : Colors.white,
      onTap: onClick,
      leading: Icon(
        iconData,
        size: (15).sp,
        color: text == "Logout"
            ? Colors.red.shade500
            : isSelected
                ? Colors.black
                : Colors.white,
      ),
      titleTextStyle: TextStyle(
          letterSpacing: 1.23,
          fontWeight: isSelected || text != "Logout"
              ? FontWeight.bold
              : FontWeight.w400,
          fontSize: text == "Logout"
              ? (10).sp
              : isSelected
                  ? (12.8).sp
                  : (11.5).sp,
          color: Colors.white),
      title: Text(
        text.toUpperCase(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
