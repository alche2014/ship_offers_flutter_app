import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/UI/auth/forgetPassword.dart';
import 'package:shipoffers/UI/auth/login.dart';
import 'package:shipoffers/UI/auth/signup1.dart';
import 'package:shipoffers/UI/auth/socialmedia.dart';
import 'package:shipoffers/UI/home/bottombar.dart';

class RestConfirmationView extends StatelessWidget {
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
                    Get.offAll(ForgetPasswordView());
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  /* decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Vector.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  */
                  child: Image.asset("assets/Rocking.png"),
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: SizedBox(
                    child: Text(
                      "Password Reset \r\nSuccessfully",
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
                    width: 275,
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  child: Text(
                    "You have successfully reset your password. Please use your new password to log in.",
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
                  width: 300,
                  height: 78,
                ),
                SizedBox(
                  height: 50,
                ),
                FlatButton(
                  onPressed: () {
                    print("Button clicked!");
                    Get.offAll(() => BottomNavigationPage());
                  },
                  child: Text(
                    "Stay Logged In",
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
              ])),
    );
  }
}
