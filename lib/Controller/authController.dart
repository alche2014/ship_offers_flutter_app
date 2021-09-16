import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shipoffers/Controller/userController.dart';
import 'package:shipoffers/UI/auth/confirmation.dart';
import 'package:shipoffers/UI/auth/login.dart';
import 'package:shipoffers/UI/auth/otp.dart';
import 'package:shipoffers/UI/auth/resetViaEmail.dart';
import 'package:shipoffers/UI/auth/signup.dart';
import 'package:shipoffers/UI/auth/signup1.dart';
import 'package:shipoffers/UI/home/bottombar.dart';
import 'package:shipoffers/constants/firebase.dart';
import 'package:shipoffers/model/user.dart';
import 'package:shipoffers/services/database.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final box = GetStorage();
  // screen var

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
  var imageURL;
  Rxn<User> firebaseUser = Rxn<User>(auth.currentUser);
  User? get user => firebaseUser.value;
  RxBool isLoggedIn = false.obs;
  String usersCollection = "users";
  Rx<UserModel> userModel = UserModel().obs;
  @override
  void onReady() {
    super.onReady();

    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    if (user == null) {
      Get.offAll(() => LoginView());
    } else if (box.read('reg') == true) {
      await getUser(user.uid);
      Get.offAll(() => BottomNavigationPage());
    } else {
      await getUser(user.uid);
      Get.offAll(() => BottomNavigationPage());
    }
  }

  Future<void> createGoogleUser(googleUser) async {
    try {
      // get the credentials to (access / id token)
      // to sign in via Firebase Authentication
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleUser.accessToken, idToken: googleUser.idToken);

      UserCredential _authResult = await auth.signInWithCredential(credential);

      UserModel _user = UserModel(
          id: _authResult.user!.uid,
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          imageURL: imageURL,
          jobRole: "Sales",
          role: '1',
          phone: '',
          dob: "1999-01-23");
      if (await Database().createNewUser(_user)) {
        Get.lazyPut(() => UserController());
        Get.find<UserController>().user = _user;
        await getUser(_authResult.user!.uid);
        box.write('reg', false);
        await getUser(_authResult.user!.uid);
        Get.offAll(ConfirmationView());
      }
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        "Try Again",
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.back();
    }
  }

  Future<void> createFbUser(token) async {
    try {
      AuthCredential credential = FacebookAuthProvider.credential(token);
      UserCredential _authResult = await auth.signInWithCredential(credential);

      UserModel _user = UserModel(
          id: _authResult.user!.uid,
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          imageURL: imageURL,
          jobRole: "Sales",
          role: '1',
          phone: '',
          dob: "1999-01-23");
      if (await Database().createNewUser(_user)) {
        Get.lazyPut(() => UserController());
        Get.find<UserController>().user = _user;
        await getUser(_authResult.user!.uid);
        box.write('reg', false);
        Get.offAll(ConfirmationView());
      }
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> createUser(String jobRole, String dob) async {
    try {
      UserCredential _authResult = await auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text);
      //create user in database.dart
      imageURL = await postFile(imageFile: imagefile);
      UserModel _user = UserModel(
          id: _authResult.user!.uid,
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          imageURL: imageURL,
          jobRole: jobRole,
          phone: '',
          role: '1',
          dob: dob);
      if (await Database().createNewUser(_user)) {
        Get.lazyPut(() => UserController());
        Get.find<UserController>().user = _user;
        box.write('reg', false);

        Get.offAll(BottomNavigationPage());
      }
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  getUser(String uid) async {
    Get.lazyPut(() => UserController());
    Get.find<UserController>().user = await Database().getUser(uid);
  }

  void login() async {
    try {
      UserCredential _authResult = await auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      Get.lazyPut(() => UserController());

      Get.find<UserController>().user =
          await Database().getUser(_authResult.user!.uid);
    } catch (e) {
      Get.snackbar(
        "Alert !",
        "",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await auth.signOut();

      Get.lazyPut(() => UserController());

      Get.find<UserController>().clear();
      Get.offAll(() => LoginView());
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  forgotPassword(String email) async {
    try {
      var authResult = await auth.sendPasswordResetEmail(email: email);
      Get.snackbar(
        "Rest",
        "Reset link sent to your email address",
        snackPosition: SnackPosition.BOTTOM,
      );

      Future.delayed(
          const Duration(seconds: 3), () => Get.offAll(ResetViaEmailView()));
    } catch (e) {
      Get.snackbar(
        "Alert !",
        "No user registered with this email.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> pickFromGallery() async {
    final result =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 30);
    //  final result = await ImagePicker().getImage(source: ImageSource.gallery);
    if (result != null) {
      Get.snackbar('Please Wait Photo is loading ', '',
          showProgressIndicator: true);
      //Most people just handle here. So it never returns anything upon cancel (iOS)
      imagefile.value = File(result.path);
      print(imagefile.value);
      update();
      Get.back();
    } else {
      //User canceled the picker. You need do something here, or just add return
      return;
    }
  }

  Future<void> pickFromCamera() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 30);
    if (pickedFile != null) {
      Get.snackbar('Please Wait Photo is loading ', '',
          showProgressIndicator: true);
      //Most people just handle here. So it never returns anything upon cancel (iOS)
      imagefile.value = File(pickedFile.path);
      print(imagefile.value);
      update();
      Get.back();
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

  Future<void> callToSignUpPage() async {
    Get.offAll(() => SignupView());
  }

  void changePassword(String password) async {
    //Create an instance of the current user.
    User? user = await auth.currentUser;

    //Pass in the password to updatePassword.
    user!.updatePassword(password).then((_) {
      print("Your password changed Succesfully ");
    }).catchError((err) {
      print("You can't change the Password" + err.toString());
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }

  CountdownTimerController? countdownTimercontroller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  counting() {
    countdownTimercontroller = CountdownTimerController(
      endTime: endTime,
    );
    void onEnd() {
      print('onEnd');
    }
  }
}
