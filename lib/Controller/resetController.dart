import 'dart:async';

import 'package:get/get.dart';
import 'package:shipoffers/UI/auth/resetPassword.dart';

class ResetController extends GetxController {
  final count = 0.obs;
  var check = 0;
  void countdown() async {
    const oneSec = const Duration(seconds: 1);
    var _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (count.value == 0) {
          timer.cancel();
        } else {
          count.value--;
          update();
        }
        update();
      },
    );

    update();
  }

  Future<void> callTohomePage() async {
    await Future.delayed(Duration(seconds: 4));
    if (check == 0) {
      Get.offAll(() => ResetPasswordView());
      check = 1;
      update();
    }
  }

  void increment() {
    // use update method to update all count variables
    update();
  }
}
