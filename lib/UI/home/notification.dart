import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shipoffers/Controller/notificationController.dart';
import 'package:shipoffers/UI/auth/signup.dart';
import 'package:shipoffers/UI/home/bottombar.dart';
import 'package:shipoffers/UI/home/menu.dart';

class NotificationView extends StatelessWidget {
  var checked = true;

  @override
  Widget build(BuildContext context) {
    // Get.put(SplashController().callTohomePage());
    ListNotificationX dx = Get.put(ListNotificationX());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
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
                            "Notifications",
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
            Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Container(
                  height: MediaQuery.of(context).size.height - 150,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('notifications')
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
                                              borderRadius:
                                                  new BorderRadius.all(
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
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    90,
                                                // color: Colors.pink,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      snapshot.data!.docs[index]
                                                                  .data()[
                                                              "title"] ??
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
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Text(
                                                        (DateFormat.yMMMd()
                                                                .add_jm()
                                                                .format(snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                    .data()[
                                                                        "date"]
                                                                    .toDate()))
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: Color(
                                                            0xffb3b6b7,
                                                          ),
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: "Roboto",
                                                        ),
                                                        textAlign:
                                                            TextAlign.right,
                                                      ),
                                                    )
                                                  ],
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                ))
          ],
        ),
      ),
    );
  }
}
