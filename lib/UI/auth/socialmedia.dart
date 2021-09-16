import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/UI/home/bottombar.dart';

class SocialMediaView extends StatelessWidget {
  late String currentText;

  var errorController;

  var textEditingController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          // margin: EdgeInsets.only(top: 250),

          child: ListView(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: SizedBox(
                    child: Text(
                      "Follow us",
                      style: TextStyle(
                        color: Color(
                          0xff59addf,
                        ),
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto",
                      ),
                      textAlign: TextAlign.center,
                    ),
                    width: 303,
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Stack(
                                      children: [
                                        Container(
                                          child:
                                              Image.asset("assets/fbnew.png"),
                                          width: 59,
                                          height: 59,
                                          decoration: BoxDecoration(
                                            color: Color(
                                              0xff3b5999,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),

                                        /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                                        Container(),
                                      ],
                                    ),
                                    width: 59,
                                    height: 59,
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "ShipOffers",
                                          style: TextStyle(
                                            color: Color(
                                              0xff313232,
                                            ),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Roboto",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "234 followers",
                                          style: TextStyle(
                                            color: Color(
                                              0xffb3b6b7,
                                            ),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Roboto",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: Container(
                                child: Text(
                                  "Like",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                                width: 60,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(
                                    0xff3b5999,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    7,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Get.snackbar(
                                    "Liked", 'Thank you for follow us');
                              },
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                        ),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(
                          12,
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
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Stack(
                                      children: [
                                        Container(
                                          child: Image.asset(
                                              "assets/instapng.png"),
                                          width: 59,
                                          height: 59,
                                          decoration: BoxDecoration(
                                            color: Color(
                                              0xffe4405f,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),

                                        /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                                        Container(),
                                      ],
                                    ),
                                    width: 59,
                                    height: 59,
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "ShipOffers",
                                          style: TextStyle(
                                            color: Color(
                                              0xff313232,
                                            ),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Roboto",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "2k followers",
                                          style: TextStyle(
                                            color: Color(
                                              0xffb3b6b7,
                                            ),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Roboto",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: Container(
                                child: Text(
                                  "Like",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                                width: 60,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(
                                    0xffe4405f,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    7,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Get.snackbar(
                                    "Liked", 'Thank you for follow us');
                              },
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                        ),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(
                          12,
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
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Stack(
                                      children: [
                                        Container(
                                          child:
                                              Image.asset("assets/tweet.png"),
                                          width: 59,
                                          height: 59,
                                          decoration: BoxDecoration(
                                            color: Color(
                                              0xff55acee,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),

                                        /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                                        Container(),
                                      ],
                                    ),
                                    width: 59,
                                    height: 59,
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "ShipOffers",
                                          style: TextStyle(
                                            color: Color(
                                              0xff313232,
                                            ),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Roboto",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "304 followers",
                                          style: TextStyle(
                                            color: Color(
                                              0xffb3b6b7,
                                            ),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Roboto",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: Container(
                                child: Text(
                                  "Like",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                                width: 60,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(
                                    0xff55acee,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    7,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Get.snackbar(
                                    "Liked", 'Thank you for follow us');
                              },
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                        ),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(
                          12,
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
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Stack(
                                      children: [
                                        Container(
                                          child: Image.asset(
                                            "assets/in.png",
                                            fit: BoxFit.fitWidth,
                                          ),
                                          width: 59,
                                          height: 59,
                                          decoration: BoxDecoration(
                                            color: Color(
                                              0xff0077b5,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),

                                        /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                                        Container(),
                                      ],
                                    ),
                                    width: 59,
                                    height: 59,
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "ShipOffers",
                                          style: TextStyle(
                                            color: Color(
                                              0xff313232,
                                            ),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Roboto",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "2k followers",
                                          style: TextStyle(
                                            color: Color(
                                              0xffb3b6b7,
                                            ),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Roboto",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: Container(
                                child: Text(
                                  "Like",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                                width: 60,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(
                                    0xff0077b5,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    7,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Get.snackbar(
                                    "Liked", 'Thank you for follow us');
                              },
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                        ),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(
                          12,
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
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 50,
                ),
                FlatButton(
                  onPressed: () {
                    print("Button clicked!");
                    Get.offAll(() => BottomNavigationPage());
                  },
                  child: Text(
                    "I Don't Have Social Media",
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
                  minWidth: MediaQuery.of(context).size.width,
                ),
              ])),
    );
  }
}
