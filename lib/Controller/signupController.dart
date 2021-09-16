import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/UI/auth/login.dart';
import 'package:shipoffers/UI/auth/signup1.dart';

class SignInPageController extends GetxController {
  int count = 0;
  RxBool checked = true.obs;
  RxBool colorSwitcher = true.obs;
  RxBool emailValidate = false.obs;
  RxBool passwordValidate = false.obs;
  RxBool nameValidate = false.obs;
  RxBool confirmPasswordValidate = false.obs;

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();

  Rxn<File> imagefile = Rxn<File>();
  final picker = ImagePicker();

  Future<void> pickFromGallery() async {
    final result = await ImagePicker().getImage(source: ImageSource.gallery);
    if (result != null) {
      //Most people just handle here. So it never returns anything upon cancel (iOS)
      imagefile.value = File(result.path);
      print(imagefile.value);
    } else {
      //User canceled the picker. You need do something here, or just add return
      return;
    }
  }

  Future<void> pickFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      //Most people just handle here. So it never returns anything upon cancel (iOS)
      imagefile.value = File(pickedFile.path);
      print(imagefile.value);
    } else {
      //User canceled the picker. You need do something here, or just add return
      return;
    }
  }

  Future<dynamic> postFile({
    required Rxn<File> imageFile,
  }) async {
    if (imageFile.value != null) {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      Reference reference =
          FirebaseStorage.instance.ref().child('profile').child(fileName);

      TaskSnapshot storageTaskSnapshot =
          await reference.putFile(imageFile.value!);

      print(storageTaskSnapshot.ref.getDownloadURL());

      var dowUrl = await storageTaskSnapshot.ref.getDownloadURL();

      return dowUrl;
    } else {
      return '';
    }
  }

  Future<void> callToSignup1Page() async {
    Get.offAll(() => SignupView1());
  }

  void checkBox() {
    if (checked.value == false) {
      checked.value = true;
    } else {
      checked.value = false;
    }
  }
}
