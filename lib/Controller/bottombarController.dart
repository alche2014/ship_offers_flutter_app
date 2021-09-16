import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavigationPageController extends GetxController {
  static BottomNavigationPageController get to => Get.find();

  final currentIndex = 0.obs;

  List<Widget> pages = [
    Container(
      color: Colors.blue,
      child: Text(
        "home",
        style: TextStyle(color: Colors.black),
      ),
    ),
    Container(child: Text("iSolved")),
    Container(child: Text("Suggestion box")),
    Container(child: Text("Contact Us")),
  ];

  Widget get currentPage => pages[currentIndex.value];

  void changePage(int _index) {
    currentIndex.value = _index;
  }

  PersistentTabController controller = PersistentTabController(initialIndex: 0);
}

class ListDataX extends GetxController {
  List<int> numbers = List<int>.from([0, 1, 2, 3]);

  void httpCall() async {
    await Future.delayed(
        Duration(seconds: 1), () => numbers.add(numbers.last + 1));
    update();
  }

  void reset() {
    numbers = numbers.sublist(0, 3);
    update();
  }
}
