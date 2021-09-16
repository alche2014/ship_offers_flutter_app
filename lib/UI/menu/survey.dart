import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shipoffers/Controller/notificationController.dart';
import 'package:shipoffers/UI/home/bottombar.dart';
import 'package:shipoffers/UI/home/menu.dart';
import 'package:shipoffers/UI/home/notification.dart';

class SurveyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get.put(SplashController().callTohomePage());
    ListNotificationX dx = Get.put(ListNotificationX());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
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
                          Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xff59ADDF),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Survey",
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
                            icon: Icon(
                              CupertinoIcons.bell,
                              color: ThemeData().primaryColor,
                            ),
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
            SizedBox(
              child: Text(
                "You Have Two Surveys Pending",
                style: TextStyle(
                  color: Color(
                    0xff313232,
                  ),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                ),
              ),
              width: 319,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "SALES",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto",
                                letterSpacing: 1,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: Color(
                                0xffeb5757,
                              ),
                              borderRadius: BorderRadius.circular(
                                4,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Self Assessment Survey",
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
                            height: 8,
                          ),
                          Container(
                            child: Text(
                              "12 Questions   |   5min",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    FlatButton(
                      onPressed: () {
                        print("Button clicked!");
                      },
                      child: Text(
                        "Take Now",
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
                      minWidth: 119,
                    ),
                  ],
                ),
                width: 335,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 15,
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
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "All Survey Result",
                style: TextStyle(
                  color: Color(
                    0xff898c8c,
                  ),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Container(
                  height: 500,
                  child: GetBuilder<ListNotificationX>(
                    builder: (_dx) => ListView.builder(
                        itemCount: _dx.numbers.length,
                        itemBuilder: (context, index) {
                          final now = DateTime.now();
                          final today = DateTime(now.year, now.month, now.day);
                          final yesterday =
                              DateTime(now.year, now.month, now.day - 1);

                          final dateToCheck = now;
                          final aDate = DateTime(dateToCheck.year,
                              dateToCheck.month, dateToCheck.day);
                          if (aDate == today) {
                          } else if (aDate == yesterday) {}
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Container(
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 58,
                                        height: 58,
                                        decoration: BoxDecoration(
                                          color: Color(
                                            0xffd5e4ec,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        width: 58,
                                        height: 58,
                                        decoration: BoxDecoration(
                                          color: Color(
                                            0xff59addf,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      ),

                                      /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                                      Container(),
                                    ],
                                  ),
                                  width: 58,
                                  height: 58,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Employee Satisfaction Survey",
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
                                        height: 10,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "11/12",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: "Roboto",
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "|",
                                              style: TextStyle(
                                                color: Color(
                                                  0xffe0e4e8,
                                                ),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Roboto",
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "95% Done",
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                        ),
                                        width: 129,
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
                              14,
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
          ],
        ),
      ),
    );
  }
}
