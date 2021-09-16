import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/Controller/bottombarController.dart';
import 'package:shipoffers/UI/home/bottombar.dart';
import 'package:shipoffers/UI/home/menu.dart';
import 'package:shipoffers/UI/home/notification.dart';
import 'package:shipoffers/UI/menu/newThread.dart';

class PastActivityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListDataX dx = Get.put(ListDataX());
    return Scaffold(
        body: Container(
            child: ListView(
      children: [
        Container(
          height: 100,
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
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Past Activities",
                              style: TextStyle(
                                color: Colors.black,
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
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                Get.offAll(() => NotificationView());
                              }),
                          IconButton(
                              icon: Icon(Icons.menu, color: Colors.grey),
                              onPressed: () {
                                Get.offAll(() => MenuView());
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
            child: Container(
              height: 695,
              child: GetBuilder<ListDataX>(
                builder: (_dx) => ListView.builder(
                    itemCount: _dx.numbers.length,
                    itemBuilder: (context, index) {
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Floyd Miles",
                                                        style: TextStyle(
                                                          color: Color(
                                                            0xff313232,
                                                          ),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: "Roboto",
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
                                                              size: 11,
                                                              color: Color(
                                                                0xff898c8c,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 3,
                                                            ),
                                                            Text(
                                                              "03",
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
                                                    ],
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                SizedBox(
                                                  child: Text(
                                                    "5h ago",
                                                    style: TextStyle(
                                                      color: Color(
                                                        0xff898c8c,
                                                      ),
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "Roboto",
                                                    ),
                                                  ),
                                                  width: 38,
                                                  height: 15,
                                                ),
                                              ],
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
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
                                                    Icons.location_on_outlined,
                                                    color: Color(
                                                      0xff898c8c,
                                                    ),
                                                    size: 11,
                                                  ),
                                                  SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text(
                                                    "Massachusetts",
                                                    style: TextStyle(
                                                      color: Color(
                                                        0xff898c8c,
                                                      ),
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            child: Text(
                                              "High Court Int\'l Discovery Case Fits Mootness Exception.",
                                              style: TextStyle(
                                                color: Color(
                                                  0xff313232,
                                                ),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Roboto",
                                              ),
                                            ),
                                            width: 262,
                                            height: 47,
                                          ),
                                          SizedBox(
                                            child: Text(
                                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus finibus metus, nec consequat lorem semper sit amet.",
                                              style: TextStyle(
                                                color: Color(
                                                  0xff5e6060,
                                                ),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
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
                                                SizedBox(
                                                  child: Text(
                                                    "12 Comments",
                                                    style: TextStyle(
                                                      color: Color(
                                                        0xff59addf,
                                                      ),
                                                      fontSize:
                                                          12.081632614135742,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontFamily: "Roboto",
                                                    ),
                                                  ),
                                                  width: 90,
                                                  height: 15,
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      /// Detected as Icon
                                                      /// FIXME: Check your design. this is an icon of node "Name=heart, Size=L". we couldn't any matching flutter native icon, so we uploaded the asset to the cloud, load from it.
                                                      Row(
                                                        children: [
                                                          Icon(
                                                              Icons
                                                                  .favorite_border,
                                                              color: Color(
                                                                0xffb3b6b7,
                                                              ),
                                                              size: 12),
                                                          SizedBox(width: 2),
                                                          Text(
                                                            "12 ",
                                                            style: TextStyle(
                                                              color: Color(
                                                                0xffb3b6b7,
                                                              ),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  "Roboto",
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                  ),
                                                ),
                                              ],
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                            ),
                                            width: 145,
                                          ),

                                          /// Detected as Icon
                                          /// FIXME: Check your design. this is an icon of node "Name=flag, Size=L". we couldn't any matching flutter native icon, so we uploaded the asset to the cloud, load from it.
                                          Icon(
                                            Icons.flag_outlined,
                                            color: Color(
                                              0xff59addf,
                                            ),
                                            size: 12,
                                          ),
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                      ),
                                      width: 276,
                                      height: 15,
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.only(
                                  top: 10,
                                  bottom: 13,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(
                                    0xfff7f9fa,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
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
                    }),
              ),
            ))
      ],
    )));
  }
}
