import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController instance = Get.find();
  RxBool isLoginWidgetDisplayed = true.obs;

  changeDIsplayedAuthWidget() async {
    Timer(Duration(seconds: 4), newload);
  }

  newload() {
    isLoginWidgetDisplayed.value = !isLoginWidgetDisplayed.value;
  }
}
