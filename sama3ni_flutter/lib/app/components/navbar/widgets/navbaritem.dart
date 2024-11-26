import 'package:flutter/material.dart';

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
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(18),
      ),
      selected: isSelected,
      selectedColor: Colors.black,
      selectedTileColor: Colors.white,
      onTap: onClick,
      leading: Icon(
        iconData,
        size: (15),
        color: isSelected ? Colors.black : Colors.white,
      ),
      titleTextStyle: TextStyle(
          letterSpacing: 1.23,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
          fontSize: isSelected ? (12.8) : (11.5),
          color: Colors.white),
      title: Text(
        text.toUpperCase(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
