import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shipoffers/Controller/bottombarController.dart';
import 'package:shipoffers/Controller/userController.dart';
import 'package:shipoffers/UI/accountSettings/editemailpass.dart';
import 'package:shipoffers/UI/accountSettings/editprofile.dart';
import 'package:shipoffers/UI/accountSettings/notificationSettings.dart';
import 'package:shipoffers/UI/accountSettings/pastactivity.dart';
import 'package:shipoffers/UI/auth/socialmedia.dart';
import 'package:shipoffers/UI/home/bottombar.dart';
import 'package:shipoffers/UI/home/menu.dart';
import 'package:shipoffers/UI/home/notification.dart';
import 'package:shipoffers/UI/menu/newThread.dart';
import 'package:shipoffers/constants/firebase.dart';
import 'package:shipoffers/services/database.dart';

class AccountView extends StatelessWidget {
  bool userData = false;
  getUserData() async {
    final User currentUser = auth.currentUser!;
    final String uid = currentUser.uid;

    Get.lazyPut(() => UserController());
    var data = await firebaseFirestore.collection("users").doc(uid).get();
    print(data["name"]);
    Get.find<UserController>().user.name = data["name"];
    Get.find<UserController>().user.email = data["email"];
    Get.find<UserController>().user.phone = data["phone"];
    Get.find<UserController>().user.jobRole = data["jobRole"];
    Get.find<UserController>().user.role = data["role"];
    Get.find<UserController>().user.imageURL = data["imageURL"];
    Get.find<UserController>().user.id = uid;
  }

  @override
  Widget build(BuildContext context) {
    //  getUserData();
    //   if (userData) {
    Get.lazyPut(() => UserController());

    ListDataX dx = Get.put(ListDataX());
    UserController userController = Get.put(UserController());
    return Scaffold(
        body: Container(
            color: ThemeData().primaryColor,
            child: Column(
              children: [
                Container(
                  color: ThemeData().primaryColor,
                  height: 220,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 20,
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Container(
                                child: Row(
                                  children: [
                                    /// Detected as Icon
                                    Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "My Account",
                                      style: TextStyle(
                                        color: Colors.white,
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
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        Get.offAll(() => NotificationView());
                                      }),
                                  IconButton(
                                      icon:
                                          Icon(Icons.menu, color: Colors.white),
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
                        height: 150,
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    userController.user.imageURL!,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Container(
                                height: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userController.user.name!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Roboto",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      userController.user.jobRole!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Roboto",
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 220,
                  color: Colors.white,
                  padding: EdgeInsets.only(
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

                                    Text(
                                      "More Options",
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
                            SizedBox(
                              height: 20,
                            ),
                            //announcment
                            InkWell(
                              onTap: () {
                                Get.offAll(() => EditProfile());
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
                                                  borderRadius: new BorderRadius
                                                          .all(
                                                      Radius.circular(10.0)),
                                                  color: Color(0xffB0CEF7)
                                                      .withOpacity(.18)),
                                              child: Icon(Icons.person,
                                                  color: Colors.blue)),
                                          SizedBox(
                                            width: 9,
                                          ),
                                          Text(
                                            "Edit Profile",
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                        size: 12, color: Colors.grey),
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                Get.offAll(() => PastActivityView());
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
                                                  borderRadius: new BorderRadius
                                                          .all(
                                                      Radius.circular(10.0)),
                                                  color: Color(0xffFFD788)
                                                      .withOpacity(.18)),
                                              child: Icon(
                                                  Icons.calendar_today_outlined,
                                                  color: Colors.yellow)),
                                          SizedBox(
                                            width: 9,
                                          ),
                                          Text(
                                            "Past Activities",
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                        size: 12, color: Colors.grey),
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                Get.offAll(() => EditEmailPassView());
                              },
                              child: Container(
                                //  padding: EdgeInsets.only(top: 40),
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
                                                  borderRadius: new BorderRadius
                                                          .all(
                                                      Radius.circular(10.0)),
                                                  color: Color(0x2dd7aff7)
                                                      .withOpacity(.18)),
                                              child: Icon(Icons.edit,
                                                  color: Colors.purple[300])),
                                          SizedBox(
                                            width: 9,
                                          ),
                                          Text(
                                            "Email & Password",
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                        size: 12, color: Colors.grey),
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                Get.offAll(() => NotificationSettingsView());
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
                                                  borderRadius: new BorderRadius
                                                          .all(
                                                      Radius.circular(10.0)),
                                                  color: Color(0xffF7C5B0)
                                                      .withOpacity(.18)),
                                              child: Icon(
                                                  Icons.settings_outlined,
                                                  color:
                                                      Colors.blueAccent[200])),
                                          SizedBox(
                                            width: 9,
                                          ),
                                          Text(
                                            "General Settings",
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                        size: 12, color: Colors.grey),
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                Get.offAll(() => SocialMediaView());
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
                                                  borderRadius: new BorderRadius
                                                          .all(
                                                      Radius.circular(10.0)),
                                                  color: Color(0xffF0AAAA)
                                                      .withOpacity(.18)),
                                              child: Icon(Icons.logout,
                                                  color: Colors.blue)),
                                          SizedBox(
                                            width: 9,
                                          ),
                                          Text(
                                            "Social Media",
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                        size: 12, color: Colors.grey),
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                            InkWell(
                              onTap: () {
                                //   Get.offAll(() => AnnouncmentView());
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
                                                  borderRadius: new BorderRadius
                                                          .all(
                                                      Radius.circular(10.0)),
                                                  color: Color(0xffF0AAAA)
                                                      .withOpacity(.18)),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                        size: 12, color: Colors.grey),
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                ),
                              ),
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width,
                      )
                    ],
                  ),
                ),
              ],
            )));
    ////  } else {
    //    return Center(
    //      child: Loader(),
    //    );
    //  }
  }
}
