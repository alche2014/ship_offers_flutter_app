import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shipoffers/Controller/bottombarController.dart';
import 'package:shipoffers/UI/home/bottombar.dart';
import 'package:shipoffers/UI/home/comments.dart';
import 'package:shipoffers/UI/home/menu.dart';
import 'package:shipoffers/UI/home/notification.dart';
import 'package:shipoffers/UI/menu/newThread.dart';
import 'package:shipoffers/constants/firebase.dart';
import 'package:shipoffers/services/database.dart';

class CommunityBoardView extends StatefulWidget {
  const CommunityBoardView({Key? key}) : super(key: key);

  @override
  _CommunityBoardViewState createState() => _CommunityBoardViewState();
}

class _CommunityBoardViewState extends State<CommunityBoardView> {
  int index = 0;
  Database _database = Database();
  Color coo = Color(
    0xffb3b6b7,
  );
  @override
  void initState() {
    // TODO: implement setState
    super.initState();

    listner();
  }

  @override
  Widget build(BuildContext context) {
    ListDataX dx = Get.put(ListDataX());
    return Scaffold(
        body: Container(
            child: Column(
      children: [
        Container(
          color: ThemeData().primaryColor,
          height: 220,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 40,
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
                              "Community Board",
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
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        "Celebrate the team! Share your wins!\r",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      onPressed: () {
                        Get.offAll(() => NewThreadView());
                        print("Button clicked!");
                      },
                      child: Text(
                        "Continue",
                      ),
                      textColor: Color(
                        0xff59addf,
                      ),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      height: 44,
                      minWidth: 133,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Container(
            child: Row(
              children: [
                InkWell(
                  child: Container(
                    child: Text(
                      "Unread",
                      style: TextStyle(
                        color: Color(
                          0xff59addf,
                        ),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto",
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: index == 0 || index == 2
                        ? BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(
                                  0x19585859,
                                ),
                                offset: Offset(
                                  10,
                                  20,
                                ),
                                blurRadius: 30,
                              ),
                            ],
                          )
                        : BoxDecoration(),
                  ),
                  onTap: () {
                    setState(() {
                      index = 2;
                    });
                  },
                ),
                InkWell(
                  child: Container(
                    child: Text(
                      "All Threads",
                      style: TextStyle(
                        color: Color(
                          0xff59addf,
                        ),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto",
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: index == 1
                        ? BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(
                                  0x19585859,
                                ),
                                offset: Offset(
                                  10,
                                  20,
                                ),
                                blurRadius: 30,
                              ),
                            ],
                          )
                        : BoxDecoration(),
                  ),
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
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
                /*   FlatButton(
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
             */
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            )),
        if (index == 0)
          Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Container(
                height: 495,
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
                            itemCount: 1,
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
                                                                snapshot
                                                                        .data!
                                                                        .docs[
                                                                            index]
                                                                        .data()["uname"] ??
                                                                    "Floyd Miles",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                    0xff313232,
                                                                  ),
                                                                  fontSize: 14,
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
                                                                      size: 11,
                                                                      color:
                                                                          Color(
                                                                        0xff898c8c,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 3,
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
                                                            snapshot.data!
                                                                        .docs[index]
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
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    child: Text(
                                                      snapshot.data!.docs[index]
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
                                                      snapshot.data!.docs[index]
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
                                                              style: TextStyle(
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
                                                              .data()["flag"] ==
                                                          false
                                                      ? Icon(
                                                          Icons.flag_outlined,
                                                          color: Color(
                                                            0xff59addf,
                                                          ),
                                                          size: 12,
                                                        )
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
                                                mainAxisSize: MainAxisSize.min,
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
                                  )
                                ],
                              );
                            });
                      }
                    }),
              )),
        if (index == 1)
          Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Container(
                height: 495,
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
                                                                snapshot
                                                                        .data!
                                                                        .docs[
                                                                            index]
                                                                        .data()["uname"] ??
                                                                    "Floyd Miles",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                    0xff313232,
                                                                  ),
                                                                  fontSize: 14,
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
                                                                      size: 11,
                                                                      color:
                                                                          Color(
                                                                        0xff898c8c,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 3,
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
                                                            snapshot.data!
                                                                        .docs[index]
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
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    child: Text(
                                                      snapshot.data!.docs[index]
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
                                                      snapshot.data!.docs[index]
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
                                                              style: TextStyle(
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
                                                              .data()["flag"] ==
                                                          false
                                                      ? InkWell(
                                                          child: Icon(
                                                            Icons.flag_outlined,
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
                                                                    .docs[index]
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
                                                mainAxisSize: MainAxisSize.min,
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
                                  )
                                ],
                              );
                            });
                      }
                    }),
              )),
        if (index == 2)
          Container(
            child: Center(
              child: Text('All read.'),
            ),
          )
      ],
    )));
  }

  void listner() {
    firebaseFirestore.collection("threads").doc().snapshots().listen((event) {
      setState(() {
        index = 0;
      });
    });
  }
}
