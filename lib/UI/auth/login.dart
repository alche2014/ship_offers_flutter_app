import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shipoffers/Controller/authController.dart';
import 'package:shipoffers/Controller/loginController.dart';
import 'package:shipoffers/UI/auth/forgetPassword.dart';
import 'package:shipoffers/UI/auth/signup.dart';
import 'package:shipoffers/UI/home/bottombar.dart';

import 'package:shipoffers/services/fb.dart';

class LoginView extends GetWidget<AuthController> {
  // final LoginPageController authController = LoginPageController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  fb authFB = fb();
  google authGoogle = google();
  @override
  Widget build(BuildContext context) {
    if (controller.box.read('email') != null) {
      controller.emailController.text = controller.box.read('email');
    }
    if (controller.box.read('password') != null) {
      controller.passwordController.text = controller.box.read('password');
    }
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      // margin: EdgeInsets.only(top: 250),
      alignment: Alignment.center,
      child: Center(
        child: ListView(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Great to see you!",
                    style: TextStyle(
                      color: Color(
                        0xff59addf,
                      ),
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    child: Text(
                      "Sign in to continue",
                      style: TextStyle(
                        color: Color(
                          0xff898c8c,
                        ),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                      ),
                    ),
                    width: 316,
                    height: 57,
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
            ),
            Obx(
              () => Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffF2F6FA),
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                          child: TextFormField(
                              controller: controller.emailController,
                              onFieldSubmitted: (value) {
                                controller.emailController.text.isEmpty
                                    ? controller.emailValidate.value = true
                                    : controller.emailValidate.value = false;
                              },
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.check_circle,
                                    color: controller.emailValidate.value
                                        ? Colors.grey
                                        : Colors.green),
                                border: InputBorder.none,
                                //labelText: 'Email',
                                hintText: 'Email',
                                errorText: controller.emailValidate.value
                                    ? 'Value Can\'t Be Empty'
                                    : null,
                              ))))),
            ),
            Obx(
              () => Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffF2F6FA),
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                          child: TextFormField(
                              onFieldSubmitted: (value) {
                                controller.passwordController.text.isEmpty
                                    ? controller.passwordValidate.value = true
                                    : controller.passwordValidate.value = false;
                              },
                              controller: controller.passwordController,
                              obscureText: controller.colorSwitcher.value,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: InkWell(
                                      child: Icon(Icons.remove_red_eye,
                                          color: controller.colorSwitcher.value
                                              ? Colors.grey
                                              : Colors.green),
                                      onTap: () {
                                        if (controller.colorSwitcher.value ==
                                            false) {
                                          controller.colorSwitcher.value = true;
                                        } else {
                                          controller.colorSwitcher.value =
                                              false;
                                        }
                                      }),
                                  errorText: controller.passwordValidate.value
                                      ? 'Value Can\'t Be Empty'
                                      : null,
                                  //labelText: 'Password',
                                  hintText: 'Password'))))),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        /// Detected as Icon
                        Obx(() =>

                            /// FIXME: Check your design. this is an icon of node "Checkmark". we couldn't any matching flutter native icon, so we uploaded the asset to the cloud, load from it.
                            Checkbox(
                              activeColor: Color(0xff59ADDF),
                              value: controller.checked.value,
                              onChanged: (value) => {
                                //  authController.checkBox(),

                                controller.checked.value = value!,
                                print(controller.checked.value),
                              },
                            )),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          "Remember my login information",
                          style: TextStyle(
                            color: Color(
                              0xff999797,
                            ),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: Text(
                      "  Forgot Password?",
                      style: TextStyle(
                        color: Color(
                          0xff59addf,
                        ),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                      ),
                    ),
                    onTap: () {
                      if (controller.emailController.text == "" ||
                          controller.emailController.text == null) {
                        Get.snackbar('Alert !', "Email is missing.");
                      } else {
                        Get.offAll(() => ForgetPasswordView());
                      }
                    },
                  )
                ],
              ),
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              onPressed: () {
                if (controller.checked.value) {
                  controller.box
                      .write('email', controller.emailController.text);
                  controller.box
                      .write('password', controller.passwordController.text);
                }
                controller.login();
              },
              child: Text(
                "Login",
              ),
              textColor: Colors.white,
              color: Color(
                0xff59addf,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              height: 50,
              minWidth: MediaQuery.of(context).size.width,
            ),
            FlatButton(
              onPressed: () {
                controller.callToSignUpPage();
              },
              child: Text(
                "Don’t have an account? Create account",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Roboto",
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Or Sign up with social media",
                    style: TextStyle(
                      color: Color(
                        0xff898c8c,
                      ),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    child: Row(
                      children: [
                        InkWell(
                          child: Container(
                            child: Container(
                              child: Image.asset("assets/facebook.png"),
                              decoration: BoxDecoration(
                                color: Color(
                                  0xff3b5999,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            width: 46,
                            height: 46,
                          ),
                          onTap: () {
                            // facebook
                            authFB.loginfb();
                            //   controller.callToSignUpPage();
                          },
                        ),
                        SizedBox(
                          width: 8.5,
                        ),
                        InkWell(
                          child: Container(
                            child: Stack(
                              children: [
                                Container(
                                  child: Image.asset("assets/Google.png"),
                                  decoration: BoxDecoration(
                                    color: Color(
                                      0xffdb4437,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                ),

                                /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                                Container(),
                              ],
                            ),
                            width: 46,
                            height: 46,
                          ),
                          onTap: () {
                            //google
                            authGoogle.signinGoogle();
                          },
                        ),

                        /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                        Container(),
                      ],
                    ),
                    width: 100.5,
                    height: 46,
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    ));
  }
}
