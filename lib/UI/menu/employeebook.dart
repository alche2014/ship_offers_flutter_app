import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/Controller/notificationController.dart';
import 'package:shipoffers/UI/auth/signup.dart';
import 'package:shipoffers/UI/home/bottombar.dart';
import 'package:shipoffers/UI/home/menu.dart';
import 'package:shipoffers/UI/home/notification.dart';
import 'package:shipoffers/UI/menu/chapterPage.dart';
import 'package:video_player/video_player.dart';

class EmployeeBook extends StatelessWidget {
  var checked = true;

  @override
  Widget build(BuildContext context) {
    // Get.put(SplashController().callTohomePage());
    ListNotificationX dx = Get.put(ListNotificationX());
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xffEDEFF0),
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
                          "Employee Handbook",
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
                Container(
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
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Container(
              child: Row(
                children: [
                  /// Detected as Icon
                  /// FIXME: Check your design. this is an icon of node "Name=search, Size=M". we couldn't any matching flutter native icon, so we uploaded the asset to the cloud, load from it.
                  Icon(
                    Icons.search,
                    color: Color(
                      0xff5e6060,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Search Here",
                    style: TextStyle(
                      color: Color(
                        0xff5e6060,
                      ),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
              ),
              width: 119,
              padding: EdgeInsets.all(
                5,
              ),
            ),
            width: MediaQuery.of(context).size.width,
          ),

          /* Container(
            padding: EdgeInsets.only(
              top: 30,
              bottom: 10,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              "We have total 10 Chapters",
              style: TextStyle(
                color: Color(
                  0xff313232,
                ),
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto",
              ),
            ),
          ),
         */
          Container(
              child: Container(
            padding: EdgeInsets.only(bottom: 50),
            height: MediaQuery.of(context).size.height - 150,
            child: GetBuilder<ListNotificationX>(
              builder: (_dx) => ListView.builder(
                  itemCount: 9,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "CHAPTER 0${index + 1}",
                                  style: TextStyle(
                                    color: Color(
                                      0xff59addf,
                                    ),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  child: Text(
                                    "What is an employee handbook?",
                                    style: TextStyle(
                                      color: Color(
                                        0xff313232,
                                      ),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Roboto",
                                    ),
                                  ),
                                  width: 304,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FlatButton(
                            onPressed: () {
                              print("Button clicked!");
                              Get.offAll(() => ChapterPageView());
                            },
                            child: Text(
                              "Read More",
                            ),
                            textColor: Colors.white,
                            color: Color(
                              0xff59addf,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                            ),
                            height: 44,
                            minWidth: 128,
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(
                        20,
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
                    );
                  }),
            ),
          ))
        ]),
      ),
    );
  }
}
