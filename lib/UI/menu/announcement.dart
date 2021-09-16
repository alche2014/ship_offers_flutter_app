import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shipoffers/Controller/notificationController.dart';
import 'package:shipoffers/UI/home/bottombar.dart';
import 'package:shipoffers/UI/home/menu.dart';
import 'package:shipoffers/UI/home/notification.dart';

class AnnouncmentView extends StatefulWidget {
  const AnnouncmentView({Key? key}) : super(key: key);

  @override
  _AnnouncmentViewState createState() => _AnnouncmentViewState();
}

class _AnnouncmentViewState extends State<AnnouncmentView> {
  var filter = 'Jul 2021';
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
                            "Announcements",
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
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(
                  "New Announcements",
                  style: TextStyle(
                    color: Color(
                      0xff313232,
                    ),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto",
                  ),
                )),
            Container(
                height: 250,
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Announcement')
                          // .where('status', isEqualTo: "active")
                          .orderBy('dateTime', descending: true)
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
                                Text("No Announcements yet."),
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
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Stack(
                                          children: [
                                            Container(
                                              child: Icon(
                                                Icons.watch_outlined,
                                                color: Colors.white,
                                              ),
                                              width: 46,
                                              height: 46,
                                              padding: EdgeInsets.all(
                                                11,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(
                                                  0xff59addf,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  8,
                                                ),
                                              ),
                                            ),

                                            /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                                            Container(),
                                          ],
                                        ),
                                        width: 46,
                                        height: 46,
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
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    (DateFormat.yMMMd()
                                                            .add_jm()
                                                            .format(snapshot
                                                                .data!
                                                                .docs[index]
                                                                .data()[
                                                                    "dateTime"]
                                                                .toDate()))
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Color(
                                                        0xffb3b6b7,
                                                      ),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "Roboto",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    snapshot.data!.docs[index]
                                                            .data()["title"] ??
                                                        "We Got a Product Launch",
                                                    style: TextStyle(
                                                      color: Color(
                                                        0xff313232,
                                                      ),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: "Roboto",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            SizedBox(
                                              child: Text(
                                                snapshot.data!.docs[index]
                                                            .data()[
                                                        "description"] ??
                                                    "In this week\'s Dribble Weekly Warm-Up, we\'re challenging you to design a branded sticker pack for a restaurant of your choice.\r\n",
                                                style: TextStyle(
                                                  color: Color(
                                                    0xff898c8c,
                                                  ),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "Roboto",
                                                ),
                                              ),
                                              width: 254,
                                              height: 68,
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
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.only(
                                    top: 15,
                                    bottom: 17,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(
                                      0xe5eff2f4,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                );
                              });
                        }
                      }),
                )),
            Container(
              child: Row(
                children: [
                  Text(
                    "All Announcements",
                    style: TextStyle(
                      color: Color(
                        0xff898c8c,
                      ),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                    ),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  Container(
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0xffF2F6FA),
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                          child: new DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                            items: <String>[
                              'Jul 2021',
                              'Aug 2021',
                              'Sep 2021',
                              'Oct 2021',
                              'Nov 2021',
                              'Dec 2021',
                              'Jan 2022',
                              'Feb 2022',
                              'Mar 2022',
                              'Apr 2022',
                              'May 2022',
                              'Jun 2022',
                              'Jul 2022',
                              'Aug 2022',
                              'Sep 2022',
                              'Oct 2022',
                              'Nov 2022',
                              'Dec 2022',
                            ].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(filter),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                filter = value!;
                              });
                            },
                          ))),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
              ),
              width: MediaQuery.of(context).size.width,
            ),
            Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Announcement')
                          .where('status', isEqualTo: "active")
                          .where('filter', isEqualTo: filter)
                          //.orderBy('dateTime', descending: true)
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
                                Text("No Announcements yet."),
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
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Stack(
                                          children: [
                                            Container(
                                              child: Icon(
                                                Icons.watch_outlined,
                                                color: Colors.white,
                                              ),
                                              width: 46,
                                              height: 46,
                                              padding: EdgeInsets.all(
                                                11,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(
                                                  0xff59addf,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  8,
                                                ),
                                              ),
                                            ),

                                            /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                                            Container(),
                                          ],
                                        ),
                                        width: 46,
                                        height: 46,
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
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    (DateFormat.yMMMd()
                                                            .add_jm()
                                                            .format(snapshot
                                                                .data!
                                                                .docs[index]
                                                                .data()[
                                                                    "dateTime"]
                                                                .toDate()))
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Color(
                                                        0xffb3b6b7,
                                                      ),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "Roboto",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    snapshot.data!.docs[index]
                                                            .data()["title"] ??
                                                        "We Got a Product Launch",
                                                    style: TextStyle(
                                                      color: Color(
                                                        0xff313232,
                                                      ),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: "Roboto",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            SizedBox(
                                              child: Text(
                                                snapshot.data!.docs[index]
                                                            .data()[
                                                        "description"] ??
                                                    "In this week\'s Dribble Weekly Warm-Up, we\'re challenging you to design a branded sticker pack for a restaurant of your choice.\n",
                                                style: TextStyle(
                                                  color: Color(
                                                    0xff898c8c,
                                                  ),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "Roboto",
                                                ),
                                              ),
                                              width: 254,
                                              height: 68,
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
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.only(
                                    top: 15,
                                    bottom: 17,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(
                                      0xe5eff2f4,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                );
                              });
                        }
                      }),
                )),
          ],
        ),
      ),
    );
  }
}
