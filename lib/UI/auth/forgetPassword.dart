import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/Controller/authController.dart';
import 'package:shipoffers/UI/auth/login.dart';
import 'package:shipoffers/UI/auth/resetViaEmail.dart';
import 'package:shipoffers/UI/auth/resetViaPhone.dart';
import 'package:shipoffers/UI/auth/signup1.dart';
import 'package:shipoffers/UI/auth/socialmedia.dart';

class ForgetPasswordView extends GetWidget<AuthController> {
  late String currentText;

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
                    Get.offAll(LoginView());
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
                  child: Image.asset("assets/Sitting.png"),
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                        height: 15,
                      ),
                      SizedBox(
                        child: Text(
                          "Select which contact details should be used to reset your password.",
                          style: TextStyle(
                            color: Color(
                              0xff898c8c,
                            ),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto",
                          ),
                          textAlign: TextAlign.center,
                        ),
                        width: 330,
                        height: 78,
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              Container(
                                child: Icon(Icons.mail_outlined,
                                    color: ThemeData().primaryColor),
                                width: 72,
                                height: 72,
                                padding: EdgeInsets.only(
                                  top: 17,
                                  bottom: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                              ),

                              /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                              Container(),
                            ],
                          ),
                          width: 72,
                          height: 72,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Via Email Address",
                                style: TextStyle(
                                  color: Color(
                                    0xff313232,
                                  ),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${controller.emailController.text}",
                                style: TextStyle(
                                  color: Color(
                                    0xff898c8c,
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(
                      10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(
                            0x11a4a5a5,
                          ),
                          offset: Offset(
                            4,
                            12,
                          ),
                          blurRadius: 17,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    print("Button clicked!");
                    controller.forgotPassword(controller.emailController.text);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              Container(
                                child: Icon(Icons.tablet_mac_rounded,
                                    color: ThemeData().primaryColor),
                                width: 72,
                                height: 72,
                                padding: EdgeInsets.all(
                                  16,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                              ),

                              /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                              Container(),
                            ],
                          ),
                          width: 72,
                          height: 72,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Via Phone Number",
                                style: TextStyle(
                                  color: Color(
                                    0xff313232,
                                  ),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Non-verified",
                                style: TextStyle(
                                  color: Color(
                                    0xff898c8c,
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(
                      10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(
                            0x11a4a5a5,
                          ),
                          offset: Offset(
                            4,
                            12,
                          ),
                          blurRadius: 17,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.offAll(() => ResetViaPhoneView());
                  },
                )
              ])),
    );
  }
}
