import 'package:get/get.dart';

class HomeController extends GetxController {
  final navItems = [
    "Browse",
    "How it works",
    "About",
    "Contact",
  ];
  var currentIndex = 0;
  void changeIndex(int index) {
    update([currentIndex]);
    currentIndex = index;
    update([index]);
  }
}
