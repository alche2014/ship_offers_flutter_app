import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/Controller/notificationController.dart';
import 'package:shipoffers/UI/auth/signup.dart';
import 'package:shipoffers/UI/home/bottombar.dart';
import 'package:shipoffers/UI/home/menu.dart';
import 'package:shipoffers/UI/home/notification.dart';
import 'package:video_player/video_player.dart';

class ChapterPageView extends StatelessWidget {
  var checked = true;

  @override
  Widget build(BuildContext context) {
    // Get.put(SplashController().callTohomePage());
    //   ListNotificationX dx = Get.put(ListNotificationX());
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        //  color: Color(0xffEDEFF0),
        padding: EdgeInsets.only(left: 20, right: 20),
        child:
            ListView(physics: const NeverScrollableScrollPhysics(), children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  child: Container(
                    child: Row(
                      children: [
                        /// Detected as Icon
                        Icon(Icons.arrow_back_ios, color: Color(0xff5e6060)),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "",
                          style: TextStyle(
                            color: Color(
                              0xff313232,
                            ),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ),
                  onTap: () {
                    Get.offAll(() => BottomNavigationPage());
                  },
                ),
                /*  Container(
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(CupertinoIcons.bell,
                              color: Color(0xff5e6060)),
                          onPressed: () {
                            Get.offAll(() => NotificationView());
                          }),
                      IconButton(
                          icon: Icon(Icons.menu, color: Color(0xff5e6060)),
                          onPressed: () {
                            Get.offAll(() => MenuView());
                          }),
                    ],
                  ),
                )
              */
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 30,
              bottom: 30,
            ),
            alignment: Alignment.center,
            child: Text(
              "CHAPTER 01",
              style: TextStyle(
                color: ThemeData().primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto",
              ),
            ),
          ),
          //Heading

          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What is an employee handbook?",
                  style: TextStyle(
                    color: Color(
                      0xff313232,
                    ),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto",
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                SizedBox(
                  child: Text(
                    "An employee handbook is a document that communicates your company’s mission, policies and expectations. Employers give this to employees to clarify their rights and responsibilities while they’re employed with the company.\r\n\r\nTo help you build the best employee handbook, we crafted a template to give you a head start in creating your own document. Download the full Employee Handbook template in .doc and PDF format by clicking on the links at the bottom of this page.\r\n\r\nWords in brackets are placeholders -- substitute them with your company’s specific guidelines. Also, feel free to modify this template’s language to match your company’s culture.",
                    style: TextStyle(
                      color: Color(
                        0xff898c8c,
                      ),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                    ),
                  ),
                  width: 331,
                  height: 466,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
          ),
          //Content
          //Button

          FlatButton(
            onPressed: () {
              print("Button clicked!");
            },
            child: Text(
              "Next Chapter",
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
            height: 44,
            minWidth: 335,
          ),
        ]),
      ),
    );
  }
}
