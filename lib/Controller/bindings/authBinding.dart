import 'package:get/get.dart';
import 'package:shipoffers/Controller/authController.dart';


class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}