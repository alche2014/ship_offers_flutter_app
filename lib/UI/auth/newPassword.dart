import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shipoffers/Controller/authController.dart';
import 'package:shipoffers/Controller/resetPasswordController.dart';
import 'package:shipoffers/UI/auth/confirmation.dart';
import 'package:shipoffers/UI/auth/forgetPassword.dart';
import 'package:shipoffers/UI/auth/login.dart';
import 'package:shipoffers/UI/auth/resetConfirmation.dart';
import 'package:shipoffers/UI/auth/signup1.dart';

class NewPasswordView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          // margin: EdgeInsets.only(top: 250),

          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            InkWell(
              child: Container(
                child: Row(
                  children: [
                    /// Detected as Icon
                    Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff59ADDF),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Back",
                      style: TextStyle(
                        color: Color(
                          0xff898c8c,
                        ),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                ),
                width: MediaQuery.of(context).size.width,
              ),
              onTap: () {
                Get.offAll(ForgetPasswordView());
              },
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Reset Password",
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
                  height: 50,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Create Password",
                              style: TextStyle(
                                color: Color(
                                  0xff313232,
                                ),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto",
                              ),
                            ),
                            Text(
                              "Must be at least 8 character.",
                              style: TextStyle(
                                color: Color(
                                  0xff898c8c,
                                ),
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Color(0xffF2F6FA),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 5),
                                child: TextFormField(
                                    controller: controller.passwordController,
                                    onFieldSubmitted: (value) {
                                      controller.passwordController.text.isEmpty
                                          ? controller.passwordValidate.value =
                                              true
                                          : controller.passwordValidate.value =
                                              false;
                                    },
                                    obscureText: controller.checked.value,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      suffixIcon: InkWell(
                                          child: Icon(Icons.remove_red_eye,
                                              color: controller.checked.value
                                                  ? Colors.grey
                                                  : Colors.green),
                                          onTap: () {
                                            if (controller.checked.value ==
                                                false) {
                                              controller.checked.value = true;
                                            } else {
                                              controller.checked.value = false;
                                            }
                                          }),

                                      //labelText: 'Email',
                                      errorText:
                                          controller.passwordValidate.value
                                              ? 'Value Can\'t Be Empty'
                                              : null,
                                      hintText: 'Create Password',
                                    ))))
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Confirm Password",
                              style: TextStyle(
                                color: Color(
                                  0xff313232,
                                ),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto",
                              ),
                            ),
                            Text(
                              "Must be at least 8 character.",
                              style: TextStyle(
                                color: Color(
                                  0xff898c8c,
                                ),
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Color(0xffF2F6FA),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 5),
                                child: TextFormField(
                                    obscureText: controller.colorSwitcher.value,
                                    controller:
                                        controller.confirmPasswordController,
                                    onFieldSubmitted: (value) {
                                      controller.confirmPasswordController.text
                                              .isEmpty
                                          ? controller.confirmPasswordValidate
                                              .value = true
                                          : controller.confirmPasswordValidate
                                              .value = false;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      suffixIcon: InkWell(
                                          child: Icon(Icons.remove_red_eye,
                                              color:
                                                  controller.colorSwitcher.value
                                                      ? Colors.grey
                                                      : Colors.green),
                                          onTap: () {
                                            if (controller
                                                    .colorSwitcher.value ==
                                                false) {
                                              controller.colorSwitcher.value =
                                                  true;
                                            } else {
                                              controller.colorSwitcher.value =
                                                  false;
                                            }
                                          }),

                                      //labelText: 'Email',
                                      errorText: controller
                                              .confirmPasswordValidate.value
                                          ? 'Value Can\'t Be Empty'
                                          : null,

                                      hintText: 'Confirm Password',
                                    ))))
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                FlatButton(
                  onPressed: () {
                    print("Button clicked!");
                    Get.snackbar('Message',
                        'Reset password request has been submitted. Notify you soon.');
                     Get.offAll(() => RestConfirmationView());
                    // controller
                    //     .changePassword(controller.passwordController.text);
                  },
                  child: Text(
                    "Create",
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
                SizedBox(
                  height: 30,
                ),
              ],
            )
          ])),
    );
  }
}
