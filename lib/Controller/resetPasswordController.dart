import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/UI/auth/login.dart';

class ResetPasswordController extends GetxController {
  int count = 0;
  RxBool checked = false.obs;
  RxBool colorSwitcher = true.obs;
  RxBool emailValidate = false.obs;
  RxBool passwordValidate = false.obs;
  RxBool nameValidate = false.obs;
  RxBool confirmPasswordValidate = false.obs;

  static ResetPasswordController to = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  Rx<File> imagefile = File('assets/lg.jpeg').obs;
  final picker = ImagePicker();

  Future<void> pickFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    imagefile.value = File(pickedFile!.path);

    update();
  }

  Future<void> pickFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    imagefile.value = File(pickedFile!.path);
    update();
  }

  Future<void> callTohomePage() async {
    await Future.delayed(Duration(seconds: 4));
    if (count == 0) {
      Get.offAll(() => LoginView());
      count = 1;
      update();
    }
  }

  void checkBox() {
    if (checked.value == false) {
      checked.value = true;
    } else {
      checked.value = false;
    }
    update();
  }

  void increment() {
    count++;
    // use update method to update all count variables
    update();
  }
}
