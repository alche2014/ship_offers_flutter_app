import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/Controller/authController.dart';
import 'package:shipoffers/Controller/resetController.dart';
import 'package:shipoffers/UI/auth/forgetPassword.dart';
import 'package:shipoffers/UI/auth/signup1.dart';
import 'package:shipoffers/UI/auth/socialmedia.dart';

class ResetViaEmailView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ResetController().callTohomePage());

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
                  /* decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Vector.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  */
                  child: Image.asset("assets/Socializing.png"),
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Text(
                          "Please log in to an email to verify your email address ${controller.emailController.text}",
                          style: TextStyle(
                            color: Color(
                              0xff313232,
                            ),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto",
                          ),
                          textAlign: TextAlign.center,
                        ),
                        width: 317,
                        height: 78,
                      ),
                      SizedBox(
                        height: 43,
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
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
              ])),
    );
  }
}
