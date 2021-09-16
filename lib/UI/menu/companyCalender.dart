import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shipoffers/Controller/notificationController.dart';
import 'package:shipoffers/UI/home/bottombar.dart';
import 'package:shipoffers/UI/home/menu.dart';
import 'package:shipoffers/UI/home/notification.dart';

class CompanyCalenderView extends StatefulWidget {
  const CompanyCalenderView({Key? key}) : super(key: key);

  @override
  _CompanyCalenderViewState createState() => _CompanyCalenderViewState();
}

class _CompanyCalenderViewState extends State<CompanyCalenderView> {
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String currentDate = DateTime.now().toString();
  String _currentMonth = DateFormat.yMMM().format(DateTime(2021, 8, 3));
  DateTime _targetDateTime = DateTime(2021, 8, 3);
  Color dm = Color(
    0xff59addf,
  );
  Color occassionColor = Color(
    0xff52c583,
  );
  Color payColor = Color(
    0xffeb5757,
  );
  Color huddlesColor = Color(
    0xfff2994a,
  );
  Color holidayColor = Color(
    0xff9b51e0,
  );
  Color eventColor = Color(
    0xff59addf,
  );
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
                            "Company Calender",
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
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: Color(
                                    0xff52c583,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Occasions",
                                style: TextStyle(
                                  color: Color(
                                    0xff898c8c,
                                  ),
                                  fontSize: 13,
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
                        Container(
                          child: Row(
                            children: [
                              Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: Color(
                                    0xffeb5757,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Pay Day",
                                style: TextStyle(
                                  color: Color(
                                    0xff898c8c,
                                  ),
                                  fontSize: 13,
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
                        Container(
                          child: Row(
                            children: [
                              Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: Color(
                                    0xff59addf,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Events",
                                style: TextStyle(
                                  color: Color(
                                    0xff898c8c,
                                  ),
                                  fontSize: 13,
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
                      ],
                    ),
                  ),

                  Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    color: Color(
                                      0xfff2994a,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Huddles ",
                                  style: TextStyle(
                                    color: Color(
                                      0xff898c8c,
                                    ),
                                    fontSize: 13,
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
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    color: Color(
                                      0xff9b51e0,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Holidays ",
                                  style: TextStyle(
                                    color: Color(
                                      0xff898c8c,
                                    ),
                                    fontSize: 13,
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
                          Container(
                            child: Text(""),
                          ),
                          Container(
                            child: Text(""),
                          )
                        ],
                      )),

                  /// wrap:positioned of "Frame 374"
                ],
              ),
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    "Calender",
                    style: TextStyle(
                      color: Color(
                        0xff898c8c,
                      ),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  /*     Container(
                    child: Row(
                      children: [
                        Text(
                          "Aug  2021",
                          style: TextStyle(
                            color: Color(
                              0xff5e6060,
                            ),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto",
                          ),
                        ),
                        SizedBox(
                          width: 19,
                        ),
                        Icon(Icons.arrow_drop_down_rounded,
                            color: Color(
                              0xffb3b6b7,
                            )),
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                    ),
                    padding: EdgeInsets.only(
                      top: 11,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
            */
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
              ),
              width: MediaQuery.of(context).size.width,
            ),
            CalendarCarousel<Event>(
              onDayPressed: (date, events) {
                events.forEach((event) => print(event.title));
                setState(() {
                  _currentDate2 = date;
                  currentDate = date.toString();
                });

                print(currentDate);
              },
              weekendTextStyle: TextStyle(
                color: Colors.black,
              ),
              thisMonthDayBorderColor: Colors.grey,
//          weekDays: null, /// for pass null when you do not want to render weekDays
              //    headerText: 'Custom Header',
              weekFormat: false,
              // markedDatesMap: _markedDateMap,
              height: 400.0,
              selectedDateTime: _currentDate2,
              showIconBehindDayText: true,
//          daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
              customGridViewPhysics: NeverScrollableScrollPhysics(),
              markedDateShowIcon: true,
              markedDateIconMaxShown: 2,
              selectedDayTextStyle: TextStyle(
                color: Colors.yellow,
              ),
              todayTextStyle: TextStyle(
                color: Colors.blue,
              ),
              markedDateIconBuilder: (event) {
                return event.icon ?? Icon(Icons.help_outline);
              },
              minSelectedDate: _currentDate.subtract(Duration(days: 360)),
              maxSelectedDate: _currentDate.add(Duration(days: 360)),
              todayButtonColor: Colors.transparent,
              todayBorderColor: Colors.green,

              markedDateMoreShowTotal:
                  true, // null for not showing hidden events indicator
//          markedDateIconMargin: 9,
//          markedDateIconOffset: 3,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Upcoming Activity",
                style: TextStyle(
                  color: Color(
                    0xff5e6060,
                  ),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                ),
              ),
            ),
            Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                child: Container(
                  height: 495,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('events')
                          .where('date', isEqualTo: currentDate)
                          .orderBy('dateTime', descending: true)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        print(_currentDate2);
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
                        if (snapshot.hasError) {
                          print(snapshot.hasError.toString());
                          return Text(snapshot.hasError.toString());
                        }
                        if (snapshot.data!.docs.length == 0) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 50.0,
                                ),
                                Text("No Events yet."),
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
                                if (snapshot.data!.docs[index]
                                        .data()["title"] ==
                                    "Occaions") {
                                  dm = occassionColor;
                                } else if (snapshot.data!.docs[index]
                                        .data()["title"] ==
                                    "Pay Day") {
                                  dm = payColor;
                                } else if (snapshot.data!.docs[index]
                                        .data()["title"] ==
                                    "Huddles") {
                                  dm = huddlesColor;
                                } else if (snapshot.data!.docs[index]
                                        .data()["title"] ==
                                    "Holidays") {
                                  dm = holidayColor;
                                } else if (snapshot.data!.docs[index]
                                        .data()["title"] ==
                                    "Event") {
                                  dm = eventColor;
                                }
                                return Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Stack(
                                          children: [
                                            Container(
                                              child: Icon(
                                                  Icons.video_call_outlined,
                                                  color: Colors.white),
                                              width: 55,
                                              height: 59,
                                              padding: EdgeInsets.only(
                                                left: 16,
                                                right: 15,
                                                top: 18,
                                                bottom: 17,
                                              ),
                                              decoration: BoxDecoration(
                                                color: dm,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                            ),

                                            /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                                            Container(),
                                          ],
                                        ),
                                        width: 55,
                                        height: 59,
                                      ),
                                      SizedBox(
                                        width: 11,
                                      ),
                                      Container(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data!.docs[index]
                                                        .data()["title"] ??
                                                    "Events",
                                                style: TextStyle(
                                                  color: Color(
                                                    0xff313232,
                                                  ),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Roboto",
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Text(
                                                (DateFormat.yMMMd().format(
                                                            snapshot.data!
                                                                .docs[index]
                                                                .data()[
                                                                    "datePick"]
                                                                .toDate()))
                                                        .toString() +
                                                    " " +
                                                    snapshot.data!.docs[index]
                                                        .data()["time"],
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: "Roboto",
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              SizedBox(
                                                child: Text(
                                                  "Location: " +
                                                      snapshot.data!.docs[index]
                                                          .data()["location"],
                                                  style: TextStyle(
                                                    color: Color(
                                                      0xff5e6060,
                                                    ),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Roboto",
                                                  ),
                                                ),
                                                width: 209,
                                                height: 19,
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              SizedBox(
                                                child: Text(
                                                  "Agenda: " +
                                                      snapshot.data!.docs[index]
                                                          .data()["agenda"],
                                                  style: TextStyle(
                                                    color: Color(
                                                      0xff5e6060,
                                                    ),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Roboto",
                                                  ),
                                                ),
                                                width: 244,
                                                height: 45,
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              SizedBox(
                                                child: Text(
                                                  snapshot.data!.docs[index]
                                                              .data()[
                                                          "description"] ??
                                                      "I have been working on a project that combines a few project management apps into one platform.",
                                                  style: TextStyle(
                                                    color: Color(
                                                      0xff898c8c,
                                                    ),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w300,
                                                    fontFamily: "Roboto",
                                                  ),
                                                ),
                                                width: 244,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      15,
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
                              });
                        }
                      }),
                )),
          ],
        ),
      ),
    );
  }

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2019, 2, 10): [
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 1',
          icon: Icon(Icons.event_available_outlined),
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 2',
          icon: Icon(Icons.event_available_outlined),
        ),
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 3',
          icon: Icon(Icons.event_available_outlined),
        ),
      ],
    },
  );
}
