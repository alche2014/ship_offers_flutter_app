import 'package:get/get.dart';
import 'package:shipoffers/UI/auth/login.dart';

class SplashController extends GetxController {
  int count = 0;

  Future<void> callTohomePage() async {
    await Future.delayed(Duration(seconds: 4));

    Get.offAll(() => LoginView());
  }
}
