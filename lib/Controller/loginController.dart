import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/UI/auth/login.dart';
import 'package:shipoffers/UI/auth/signup.dart';

class LoginPageController extends GetxController {
  int count = 0;
  RxBool checked = false.obs;
  RxBool colorSwitcher = true.obs;
  RxBool emailValidate = false.obs;
  RxBool passwordValidate = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> callToSignUpPage() async {
    Get.offAll(() => SignupView());
  }

  void checkBox() {
    if (checked.value == false) {
      checked.value = true;
    } else {
      checked.value = false;
    }
  }
}
