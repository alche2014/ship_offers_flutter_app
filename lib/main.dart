import 'dart:ui';
import 'package:get_storage/get_storage.dart';
import 'package:shipoffers/Controller/appController.dart';
import 'package:shipoffers/Controller/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/UI/splash.dart';
import 'package:shipoffers/constants/firebase.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(AppController());
    Get.put(AuthController());
  });
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/lg.jpeg"), context);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xff59ADDF), accentColor: Color(0xff59ADDF)),
      home: SplashView(),
    );
  }
}
