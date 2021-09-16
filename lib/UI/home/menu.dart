import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/Controller/notificationController.dart';
import 'package:shipoffers/Controller/userController.dart';
import 'package:shipoffers/UI/auth/login.dart';
import 'package:shipoffers/UI/menu/account.dart';
import 'package:shipoffers/UI/menu/announcement.dart';
import 'package:shipoffers/UI/auth/signup.dart';
import 'package:shipoffers/UI/home/bottombar.dart';
import 'package:shipoffers/UI/menu/communityBoard.dart';
import 'package:shipoffers/UI/menu/companyCalender.dart';
import 'package:shipoffers/UI/menu/employeebook.dart';
import 'package:shipoffers/UI/menu/resourceLibrary.dart';
import 'package:shipoffers/UI/menu/survey.dart';

import 'package:shipoffers/Controller/authController.dart';
import 'package:shipoffers/services/database.dart';

class MenuView extends GetWidget<AuthController> {
  var checked = true;

  @override
  Widget build(BuildContext context) {

   
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 70,
          left: 20,
          right: 20,
        ),
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
                            CupertinoIcons.multiply,
                            color: Color(0xff59ADDF),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Menu",
                            style: TextStyle(
                              color: Color(
                                0xff59addf,
                              ),
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
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
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //announcment
                  InkWell(
                    onTap: () {
                      Get.offAll(() => AnnouncmentView());
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 40),
                      child: Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                /// Detected as Icon
                                /// FIXME: Check your design. this is an icon of node "Icons". we couldn't any matching flutter native icon, so we uploaded the asset to the cloud, load from it.
                                Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color:
                                            Color(0x2dd7aff7).withOpacity(.18)),
                                    child: Icon(CupertinoIcons.volume_up,
                                        color: Colors.purple[300])),
                                SizedBox(
                                  width: 9,
                                ),
                                Text(
                                  "Announcements",
                                  style: TextStyle(
                                    color: Color(
                                      0xff5e6060,
                                    ),
                                    fontSize: 16,
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
                            width: 21,
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 12, color: Colors.grey),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(height: 2, color: Colors.grey[300]),
                  SizedBox(
                    height: 20,
                  ),
                  //Company Calender
                  InkWell(
                    onTap: () {
                      Get.offAll(() => CompanyCalenderView());
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                /// Detected as Icon
                                /// FIXME: Check your design. this is an icon of node "Icons". we couldn't any matching flutter native icon, so we uploaded the asset to the cloud, load from it.
                                Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color:
                                            Color(0xffFFD788).withOpacity(.18)),
                                    child: Icon(Icons.calendar_today_outlined,
                                        color: Colors.yellow)),
                                SizedBox(
                                  width: 9,
                                ),
                                Text(
                                  "Company Calender",
                                  style: TextStyle(
                                    color: Color(
                                      0xff5e6060,
                                    ),
                                    fontSize: 16,
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
                            width: 21,
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 12, color: Colors.grey),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(height: 2, color: Colors.grey[300]),
                  SizedBox(
                    height: 20,
                  ),
                  // Community Board
                  InkWell(
                    onTap: () {
                      Get.offAll(() => CommunityBoardView());
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                /// Detected as Icon
                                /// FIXME: Check your design. this is an icon of node "Icons". we couldn't any matching flutter native icon, so we uploaded the asset to the cloud, load from it.
                                Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color:
                                            Color(0xffB0CEF7).withOpacity(.18)),
                                    child: Icon(Icons.format_align_left,
                                        color: Colors.blue)),
                                SizedBox(
                                  width: 9,
                                ),
                                Text(
                                  "Community Board",
                                  style: TextStyle(
                                    color: Color(
                                      0xff5e6060,
                                    ),
                                    fontSize: 16,
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
                            width: 21,
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 12, color: Colors.grey),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(height: 2, color: Colors.grey[300]),
                  SizedBox(
                    height: 20,
                  ),

                  // survey
                  InkWell(
                    onTap: () {
                      Get.offAll(() => SurveyView());
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                /// Detected as Icon
                                /// FIXME: Check your design. this is an icon of node "Icons". we couldn't any matching flutter native icon, so we uploaded the asset to the cloud, load from it.
                                Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color:
                                            Color(0xffF0AAAA).withOpacity(.18)),
                                    child: Icon(CupertinoIcons.layers,
                                        color: Colors.redAccent)),
                                SizedBox(
                                  width: 9,
                                ),
                                Text(
                                  "Survey",
                                  style: TextStyle(
                                    color: Color(
                                      0xff5e6060,
                                    ),
                                    fontSize: 16,
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
                            width: 21,
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 12, color: Colors.grey),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(height: 2, color: Colors.grey[300]),
                  SizedBox(
                    height: 20,
                  ),
                  //Resource Library
                  InkWell(
                    onTap: () {
                      Get.offAll(() => ResourceLibraryView());
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                /// Detected as Icon
                                /// FIXME: Check your design. this is an icon of node "Icons". we couldn't any matching flutter native icon, so we uploaded the asset to the cloud, load from it.
                                Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color:
                                            Color(0xffB7BF87).withOpacity(.18)),
                                    child: Icon(CupertinoIcons.book,
                                        color: Colors.green)),
                                SizedBox(
                                  width: 9,
                                ),
                                Text(
                                  "Resource Library",
                                  style: TextStyle(
                                    color: Color(
                                      0xff5e6060,
                                    ),
                                    fontSize: 16,
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
                            width: 21,
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 12, color: Colors.grey),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(height: 2, color: Colors.grey[300]),
                  SizedBox(
                    height: 20,
                  ),
                  // Employee Handbook
                  InkWell(
                    onTap: () {
                      Get.offAll(() => EmployeeBook());
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                /// Detected as Icon
                                /// FIXME: Check your design. this is an icon of node "Icons". we couldn't any matching flutter native icon, so we uploaded the asset to the cloud, load from it.
                                Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color:
                                            Color(0xffF7B0D6).withOpacity(.18)),
                                    child: Icon(Icons.bookmark_outline_rounded,
                                        color: Colors.pink)),
                                SizedBox(
                                  width: 9,
                                ),
                                Text(
                                  "Employee Handbook",
                                  style: TextStyle(
                                    color: Color(
                                      0xff5e6060,
                                    ),
                                    fontSize: 16,
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
                            width: 21,
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 12, color: Colors.grey),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(height: 2, color: Colors.grey[300]),
                  SizedBox(
                    height: 20,
                  ),
                  // Account Settings
                  InkWell(
                    onTap: () {

                      
                      Get.offAll(() => AccountView());
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                /// Detected as Icon
                                /// FIXME: Check your design. this is an icon of node "Icons". we couldn't any matching flutter native icon, so we uploaded the asset to the cloud, load from it.
                                Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color:
                                            Color(0xffF7C5B0).withOpacity(.18)),
                                    child: Icon(Icons.settings_outlined,
                                        color: Colors.orange)),
                                SizedBox(
                                  width: 9,
                                ),
                                Text(
                                  "Account Settings",
                                  style: TextStyle(
                                    color: Color(
                                      0xff5e6060,
                                    ),
                                    fontSize: 16,
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
                            width: 21,
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 12, color: Colors.grey),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(height: 2, color: Colors.grey[300]),
                  SizedBox(
                    height: 20,
                  ),
                  // Log Out
                  //
                  InkWell(
                    onTap: () {
                      controller.signOut();
                      // Get.offAll(() => LoginView());
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                /// Detected as Icon
                                /// FIXME: Check your design. this is an icon of node "Icons". we couldn't any matching flutter native icon, so we uploaded the asset to the cloud, load from it.
                                Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color:
                                            Color(0xffF0AAAA).withOpacity(.18)),
                                    child: Icon(Icons.logout,
                                        color: Colors.redAccent)),
                                SizedBox(
                                  width: 9,
                                ),
                                Text(
                                  "Log Out",
                                  style: TextStyle(
                                    color: Color(
                                      0xff5e6060,
                                    ),
                                    fontSize: 16,
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
                            width: 21,
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 12, color: Colors.grey),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(height: 2, color: Colors.grey[300]),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
