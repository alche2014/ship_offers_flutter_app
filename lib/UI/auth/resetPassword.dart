import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shipoffers/Controller/authController.dart';
import 'package:shipoffers/Controller/resetController.dart';
import 'package:shipoffers/UI/auth/confirmation.dart';
import 'package:shipoffers/UI/auth/forgetPassword.dart';
import 'package:shipoffers/UI/auth/newPassword.dart';
import 'package:shipoffers/UI/auth/signup1.dart';

class ResetPasswordView extends GetWidget<AuthController> {
  String? currentText;

  var errorController;

  var textEditingController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          // margin: EdgeInsets.only(top: 250),

          child: ListView(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                Container(
                  child: Image.asset("assets/Riding.png"),
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Text(
                          "Enter 4 digit code that we sent to your email to ${controller.emailController.text}",
                          style: TextStyle(
                            color: Color(
                              0xff898c8c,
                            ),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Calibre",
                          ),
                          textAlign: TextAlign.center,
                        ),
                        width: 312,
                        height: 43,
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    //  backgroundColor: Colors.blue.shade50,
                    // enableActiveFill: true,

                    errorAnimationController: errorController,
                    controller: textEditingController,
                    onCompleted: (v) {
                      currentText = v;
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);

                      currentText = value;
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Code Expire in: ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Calibre",
                      ),
                      textAlign: TextAlign.center,
                    ),
                    CountdownTimer(
                      controller: controller.countdownTimercontroller,
                      endTime: controller.endTime,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                FlatButton(
                  onPressed: () {
                    if (currentText == "" || currentText == null) {
                      Get.snackbar('Alert !', "Code is missing");
                    } else {
                      print("Button clicked!");
                      Get.offAll(() => NewPasswordView());
                    }
                  },
                  child: Text(
                    "Submit",
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
                InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't get the code? ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Roboto",
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Resend.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: ThemeData().primaryColor,
                            fontFamily: "Roboto",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.snackbar("Code Resend",
                          'Your our digit code has been sent to your email');
                    })
              ])),
    );
  }
}
