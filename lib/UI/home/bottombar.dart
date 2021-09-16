import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shipoffers/Controller/bottombarController.dart';

import 'package:get/get.dart';
import 'package:shipoffers/Controller/notificationController.dart';
import 'package:shipoffers/UI/home/comments.dart';
import 'package:shipoffers/UI/home/menu.dart';
import 'package:shipoffers/UI/home/notification.dart';
import 'package:shipoffers/UI/menu/communityBoard.dart';
import 'package:shipoffers/services/database.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomNavigationPage extends StatelessWidget {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  static var _current = 0;

  static TextEditingController descriptionController = TextEditingController();
  static TextEditingController titleController = TextEditingController();
  static Database _database = Database();
  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavigationPageController());
    ListDataX dx = Get.put(ListDataX());
    return PersistentTabView(
      context,
      controller: controller,
      screens: pages,
      items: _navBarsItems(),
      confineInSafeArea: true,

      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
          adjustScreenBottomPaddingOnCurve: true),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style10, // Choose the nav bar style with this property.
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorSecondary: CupertinoColors.white,
        activeColorPrimary: ThemeData().primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.umbrella),
        title: ("iSolved"),
        activeColorSecondary: CupertinoColors.white,
        activeColorPrimary: ThemeData().primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.brightness),
        title: ("Suggestion Box"),
        activeColorSecondary: CupertinoColors.white,
        activeColorPrimary: ThemeData().primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.mail),
        title: ("Contact HR"),
        activeColorSecondary: CupertinoColors.white,
        activeColorPrimary: ThemeData().primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  List<Widget> pages = [
    Container(
        color: ThemeData().primaryColor,
        child: ListView(
          children: [
            Container(
              color: ThemeData().primaryColor,
              height: 300,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 100,
                            child: Image.asset(
                              "assets/logo.png",
                            )),
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
                                  icon: Icon(Icons.menu, color: Colors.white),
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
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Container(
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Announcement')
                                .where('status', isEqualTo: "active")
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData)
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Loading..."),
                                      SizedBox(
                                        height: 50.0,
                                      ),
                                      CircularProgressIndicator()
                                    ],
                                  ),
                                );

                              if (snapshot.data!.docs.length == 0) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 50.0,
                                      ),
                                      Text("No Announcements yet."),
                                      SizedBox(
                                        height: 50.0,
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Container(
                                    height: 200,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.docs.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                              child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      100,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          new BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0)),
                                                      color: Colors.white),
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            10.0)),
                                                                color: Colors
                                                                    .grey[300]),
                                                            child: Image.asset(
                                                              "assets/smile.png",
                                                              width: 24,
                                                            ),
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  child: Text(
                                                                    snapshot.data!
                                                                            .docs[index]
                                                                            .data()["title"] ??
                                                                        "Floyd Miles",
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          Color(
                                                                        0xff313232,
                                                                      ),
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          "Roboto",
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          Text(
                                                                        snapshot.data!.docs[index].data()["description"] ??
                                                                            "Pulvinar consequat tempor. Curabitur ulvinar in libero eu semper. Aenean nec faucibus turpis.",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(
                                                                            0xff5e6060,
                                                                          ),
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontFamily:
                                                                              "Roboto",
                                                                        ),
                                                                      ),
                                                                      width:
                                                                          230,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          12,
                                                                    ),
                                                                    Text(
                                                                      (DateFormat.yMMMd().add_jm().format(snapshot
                                                                              .data!
                                                                              .docs[index]
                                                                              .data()["dateTime"]
                                                                              .toDate()))
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        color:
                                                                            Color(
                                                                          0xff59addf,
                                                                        ),
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontFamily:
                                                                            "Roboto",
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ))));
                                        }));
                              }
                            }),
                      )),
                ],
              ),
            ),
            Container(
                color: Colors.white,
                padding:
                    EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      "Our Community",
                      style: TextStyle(
                        color: Color(
                          0xff313232,
                        ),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        "View All",
                        style: TextStyle(
                          color: Color(
                            0xff59addf,
                          ),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto",
                        ),
                      ),
                      onPressed: () {
                        Get.offAll(() => CommunityBoardView());
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )),
            Container(
                color: Colors.white,
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                child: Container(
                  height: 405,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('threads')
                          .orderBy('date', descending: true)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData)
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Loading..."),
                                SizedBox(
                                  height: 50.0,
                                ),
                                CircularProgressIndicator()
                              ],
                            ),
                          );

                        if (snapshot.data!.docs.length == 0) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 50.0,
                                ),
                                Text("No Threads yet."),
                                SizedBox(
                                  height: 50.0,
                                ),
                              ],
                            ),
                          );
                        } else {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                snapshot.data!.docs[index]
                                                        .data()["uimageURL"] ??
                                                    "https://image.shutterstock.com/image-photo/closeup-photo-amazing-short-hairdo-260nw-1617540484.jpg",
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
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  snapshot
                                                                          .data!
                                                                          .docs[
                                                                              index]
                                                                          .data()["uname"] ??
                                                                      "Floyd Miles",
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        Color(
                                                                      0xff313232,
                                                                    ),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontFamily:
                                                                        "Roboto",
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Container(
                                                                  child: Row(
                                                                    children: [
                                                                      /// Detected as Icon
                                                                      /// FIXME: Check your design. this is an icon of node "Name=users, Size=M". we couldn't any matching flutter native icon, so we uploaded the asset to the cloud, load from it.
                                                                      Icon(
                                                                        Icons
                                                                            .people_alt_outlined,
                                                                        size:
                                                                            11,
                                                                        color:
                                                                            Color(
                                                                          0xff898c8c,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            3,
                                                                      ),
                                                                      Text(
                                                                        "03",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(
                                                                            0xff898c8c,
                                                                          ),
                                                                          fontSize:
                                                                              11,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          fontFamily:
                                                                              "Roboto",
                                                                        ),
                                                                      ),
                                                                    ],
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                  ),
                                                                ),
                                                              ],
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 7,
                                                          ),
                                                          SizedBox(
                                                            child: Text(
                                                              (DateFormat.yMMMd()
                                                                      .add_jm()
                                                                      .format(snapshot
                                                                          .data!
                                                                          .docs[
                                                                              index]
                                                                          .data()[
                                                                              "date"]
                                                                          .toDate()))
                                                                  .toString(),
                                                              style: TextStyle(
                                                                color: Color(
                                                                  0xff898c8c,
                                                                ),
                                                                fontSize: 8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    "Roboto",
                                                              ),
                                                            ),
                                                            width: 100,
                                                          ),
                                                        ],
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                      ),
                                                      width: 277,
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      child: Container(
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .location_on_outlined,
                                                              color: Color(
                                                                0xff898c8c,
                                                              ),
                                                              size: 11,
                                                            ),
                                                            SizedBox(
                                                              width: 3,
                                                            ),
                                                            Text(
                                                              snapshot
                                                                          .data!
                                                                          .docs[
                                                                              index]
                                                                          .data()[
                                                                      "location"] ??
                                                                  "Massachusetts",
                                                              style: TextStyle(
                                                                color: Color(
                                                                  0xff898c8c,
                                                                ),
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    "Roboto",
                                                              ),
                                                            ),
                                                          ],
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 11,
                                              ),
                                              Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      child: Text(
                                                        snapshot.data!
                                                                    .docs[index]
                                                                    .data()[
                                                                "title"] ??
                                                            "High Court Int\'l Discovery Case Fits Mootness Exception.",
                                                        style: TextStyle(
                                                          color: Color(
                                                            0xff313232,
                                                          ),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: "Roboto",
                                                        ),
                                                      ),
                                                      width: 262,
                                                      height: 47,
                                                    ),
                                                    SizedBox(
                                                      child: Text(
                                                        snapshot.data!
                                                                    .docs[index]
                                                                    .data()[
                                                                "content"] ??
                                                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus finibus metus, nec consequat lorem semper sit amet.",
                                                        style: TextStyle(
                                                          color: Color(
                                                            0xff5e6060,
                                                          ),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontFamily: "Roboto",
                                                        ),
                                                      ),
                                                      width: 276,
                                                      height: 51,
                                                    ),
                                                  ],
                                                ),
                                                width: 276,
                                              ),
                                              SizedBox(
                                                height: 11,
                                              ),
                                              SizedBox(
                                                height: 11,
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          InkWell(
                                                            child: SizedBox(
                                                              child: Text(
                                                                snapshot
                                                                        .data!
                                                                        .docs[
                                                                            index]
                                                                        .data()[
                                                                            "comments"]
                                                                        .toString() +
                                                                    ' Comments',
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                    0xff59addf,
                                                                  ),
                                                                  fontSize:
                                                                      12.081632614135742,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontFamily:
                                                                      "Roboto",
                                                                ),
                                                              ),
                                                              width: 90,
                                                              height: 15,
                                                            ),
                                                            onTap: () {
                                                              Get.to(
                                                                CommentsView(
                                                                    data: snapshot
                                                                        .data!
                                                                        .docs[
                                                                            index]
                                                                        .data(),
                                                                    uid: snapshot
                                                                        .data!
                                                                        .docs[
                                                                            index]
                                                                        .id),
                                                              );
                                                            },
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              children: [
                                                                /// Detected as Icon
                                                                /// FIXME: Check your design. this is an icon of node "Name=heart, Size=L". we couldn't any matching flutter native icon, so we uploaded the asset to the cloud, load from it.
                                                                InkWell(
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .favorite_border,
                                                                          color:
                                                                              Color(
                                                                            0xffb3b6b7,
                                                                          ),
                                                                          size:
                                                                              12,
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                2),
                                                                        Text(
                                                                          snapshot
                                                                              .data!
                                                                              .docs[index]
                                                                              .data()["likes"]
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Color(
                                                                              0xffb3b6b7,
                                                                            ),
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontFamily:
                                                                                "Roboto",
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    onTap: () {
                                                                      Get.snackbar(
                                                                          'Liked',
                                                                          '');
                                                                      _database.addlike(
                                                                          snapshot
                                                                              .data!
                                                                              .docs[
                                                                                  index]
                                                                              .id,
                                                                          snapshot
                                                                              .data!
                                                                              .docs[index]
                                                                              .data()["likes"]);
                                                                    })
                                                              ],
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                            ),
                                                          ),
                                                        ],
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                      ),
                                                      width: 145,
                                                    ),

                                                    /// Detected as Icon
                                                    /// FIXME: Check your design. this is an icon of node "Name=flag, Size=L". we couldn't any matching flutter native icon, so we uploaded the asset to the cloud, load from it.
                                                    snapshot.data!.docs[index]
                                                                    .data()[
                                                                "flag"] ==
                                                            false
                                                        ? InkWell(
                                                            child: Icon(
                                                              Icons
                                                                  .flag_outlined,
                                                              color: Color(
                                                                0xff59addf,
                                                              ),
                                                              size: 12,
                                                            ),
                                                            onTap: () {
                                                              Get.snackbar(
                                                                  'Marked as inappropriate',
                                                                  '');
                                                              _database.addFlag(
                                                                  true,
                                                                  snapshot
                                                                      .data!
                                                                      .docs[
                                                                          index]
                                                                      .id);
                                                            })
                                                        : Icon(
                                                            Icons.flag_outlined,
                                                            color: Colors.red,
                                                            size: 12,
                                                          ),
                                                  ],
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                ),
                                                width: 276,
                                                height: 15,
                                              ),
                                            ],
                                          ),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      height: 2,
                                      color: Colors.grey[300],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                );
                              });
                        }
                      }),
                ))
          ],
        )),
    Container(
        padding: EdgeInsets.all(20),
        // margin: EdgeInsets.only(top: 250),

        child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
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
                              color: Color(
                                0xff313232,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "iSolved App",
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
                        //  Get.offAll(() => BottomNavigationPage());
                      },
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                CupertinoIcons.bell,
                                color: Color(
                                  0xff313232,
                                ),
                              ),
                              onPressed: () {
                                Get.offAll(() => NotificationView());
                              }),
                          IconButton(
                              icon: Icon(Icons.menu,
                                  color: Color(
                                    0xff313232,
                                  )),
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
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Vector.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),

                child: Image.asset(
                  "assets/Dating.png",
                  width: 350,
                ),
                //   width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                child: Text(
                  " Clicking this link will take you to the iSolved application where you can view your pay stub, request time off and more!",
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
                height: 100,
              ),
              SizedBox(
                height: 50,
              ),
              FlatButton(
                onPressed: () {
                  print("Button clicked!");
                  // Get.back();
                  Get.defaultDialog(
                      title: "App Links",
                      middleText: '',
                      actions: [
                        FlatButton(
                          onPressed: () async {
                            print("Button clicked!");
                            // Get.back();
                            await canLaunch(
                                    "https://play.google.com/store/apps/details?id=com.infinisource.iSolvedTime.Mobile&hl=en_US&gl=US")
                                ? await launch(
                                    "https://play.google.com/store/apps/details?id=com.infinisource.iSolvedTime.Mobile&hl=en_US&gl=US")
                                : throw 'Could not launch https://play.google.com/store/apps/details?id=com.infinisource.iSolvedTime.Mobile&hl=en_US&gl=US';
                          },
                          child: Text(
                            "Open Google App Link",
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
                          //    minWidth: MediaQuery.of(context).size.width,
                        ),
                        FlatButton(
                          onPressed: () async {
                            print("Button clicked!");
                            // Get.back();
                            await canLaunch(
                                    "https://apps.apple.com/us/app/isolvedgo/id1112601539")
                                ? await launch(
                                    "https://apps.apple.com/us/app/isolvedgo/id1112601539")
                                : throw 'Could not launch https://apps.apple.com/us/app/isolvedgo/id1112601539';
                          },
                          child: Text(
                            "Open Apple App Link",
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
                          //    minWidth: MediaQuery.of(context).size.width,
                        ),
                      ]);
                },
                child: Text(
                  "Open Link",
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
                //    minWidth: MediaQuery.of(context).size.width,
              ),
            ])),
    Container(
        //   padding: EdgeInsets.all(20),
        // margin: EdgeInsets.only(top: 250),
        padding: EdgeInsets.all(20),
        child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
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
                            Icon(Icons.arrow_back_ios,
                                color: Color(
                                  0xff313232,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Suggestion",
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
                        //  Get.offAll(() => BottomNavigationPage());
                      },
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(CupertinoIcons.bell,
                                  color: Color(
                                    0xff313232,
                                  )),
                              onPressed: () {
                                Get.offAll(() => NotificationView());
                              }),
                          IconButton(
                              icon: Icon(Icons.menu,
                                  color: Color(
                                    0xff313232,
                                  )),
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
                height: 20,
              ),
              Container(
                height: 600,
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('suggestion')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData)
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("Loading..."),
                              SizedBox(
                                height: 50.0,
                              ),
                              CircularProgressIndicator()
                            ],
                          ),
                        );

                      if (snapshot.data!.docs.length == 0) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 50.0,
                              ),
                              Text("No Suggestions yet."),
                              SizedBox(
                                height: 50.0,
                              ),
                            ],
                          ),
                        );
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius: new BorderRadius.all(
                                                Radius.circular(10.0)),
                                            color: Colors.grey[300]),
                                        child: Icon(Icons.flag_outlined,
                                            color: Colors.redAccent),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    snapshot.data!.docs[index]
                                                            .data()["title"] ??
                                                        "someone flagged your comments",
                                                    style: TextStyle(
                                                      color: Color(
                                                        0xff313232,
                                                      ),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: "Roboto",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    snapshot.data!.docs[index]
                                                            .data()["date"] ??
                                                        "3days ago",
                                                    style: TextStyle(
                                                      color: Color(
                                                        0xffb3b6b7,
                                                      ),
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "Roboto",
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                mainAxisSize: MainAxisSize.min,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              child: Text(
                                                snapshot.data!.docs[index]
                                                            .data()[
                                                        "description"] ??
                                                    "Proin in auctor nunc. Donec euismod eget sapien vel venenatis.",
                                                style: TextStyle(
                                                  color: Color(
                                                    0xff898c8c,
                                                  ),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Roboto",
                                                ),
                                              ),
                                              width: 268,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    height: 2,
                                    color: Colors.grey[300],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ));
                            });
                      }
                    }),
              )
            ])),
    Container(
        padding: EdgeInsets.all(20),
        // margin: EdgeInsets.only(top: 250),

        child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 20,
                  //  left: 20,
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
                              color: Color(
                                0xff313232,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "We Are Here To Help",
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
                        //  Get.offAll(() => BottomNavigationPage());
                      },
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                CupertinoIcons.bell,
                                color: Color(
                                  0xff313232,
                                ),
                              ),
                              onPressed: () {
                                Get.offAll(() => NotificationView());
                              }),
                          IconButton(
                              icon: Icon(Icons.menu,
                                  color: Color(
                                    0xff313232,
                                  )),
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
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 30,
                  bottom: 30,
                ),
                child: Text(
                  "Please include why you need to contact HR.",
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
              Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "What do you need help with?",
                            style: TextStyle(
                              color: Color(
                                0xff313232,
                              ),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto",
                            ),
                          ),
                          Text(
                            "",
                            style: TextStyle(
                              color: Color(
                                0xff898c8c,
                              ),
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              fontFamily: "Roboto",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: Color(0xffF2F6FA),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 5),
                              child: TextFormField(
                                  controller: titleController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Write Here',
                                  ))))
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your Message",
                            style: TextStyle(
                              color: Color(
                                0xff313232,
                              ),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto",
                            ),
                          ),
                          Text(
                            "Keep it short and simple",
                            style: TextStyle(
                              color: Color(
                                0xff898c8c,
                              ),
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              fontFamily: "Roboto",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: Color(0xffF2F6FA),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 5),
                              child: TextFormField(
                                  controller: descriptionController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Write Here',
                                  ))))
                    ],
                  )),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                onPressed: () {
                  print(titleController.text);
                  _database.addHelp(titleController.text.trim(),
                      descriptionController.text.trim());
                  print("Button clicked!");
                  Get.defaultDialog(
                      title: "Submission Successful",
                      confirm: FlatButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Close",
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
                        minWidth: 500,
                      ),
                      content: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            SizedBox(
                              child: Text(
                                "Submission Successful. Thank you.",
                                style: TextStyle(
                                  color: Color(
                                    0xff313232,
                                  ),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                ),
                              ),
                              width: 400,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        width: 500,
                      ));
                },
                child: Text(
                  "Send",
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
                minWidth: 500,
                //    minWidth: MediaQuery.of(context).size.width,
              ),
            ])),
  ];
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
];
