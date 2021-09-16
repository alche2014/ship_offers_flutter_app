import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/UI/auth/signup1.dart';
import 'package:shipoffers/UI/auth/socialmedia.dart';

class ConfirmationView extends StatelessWidget {
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
                    Get.offAll(SignupView1());
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
                  child: Image.asset("assets/Happy.png"),
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: SizedBox(
                    child: Text(
                      "Account Verification Successful.",
                      style: TextStyle(
                        color: Color(
                          0xff59addf,
                        ),
                        fontSize: 24,
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
                  height: 50,
                ),
                FlatButton(
                  onPressed: () {
                    print("Button clicked!");
                    Get.offAll(() => SocialMediaView());
                  },
                  child: Text(
                    "Go To Home Page",
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
