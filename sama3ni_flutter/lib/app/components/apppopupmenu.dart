/* import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPopupMenu<T> extends StatelessWidget {
  const AppPopupMenu(
      {super.key, required this.length, this.itemAsString, this.itemId});
  final String Function(T value)? itemId;

  final String Function(T value)? itemAsString;
  final int length;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      constraints: BoxConstraints(
        minWidth: Get.width * 0.18,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Track types"),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.grey.shade400,
          ),
        ],
      ),
      itemBuilder: (BuildContext context) => List.generate(
       length,
        (index) => PopupMenuItem<T>(
          value: ,
          child: GetBuilder<TracksController>(
              id: controller.trackTypes[index].name,
              builder: (_) {
                return CheckboxListTile(
                    title: Text(controller.trackTypes[index].name),
                    value: controller.selectedTrackTypes.any((trackType) =>
                        trackType == controller.trackTypes[index]),
                    onChanged: (v) {
                      controller.selectTrackType(controller.trackTypes[index]);
                    });
              }),
        ),
      ),
    );
  }
}
 */