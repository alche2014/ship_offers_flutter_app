import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/UI/home/menu.dart';
import 'package:shipoffers/UI/home/notification.dart';

class NotificationSettingsView extends StatelessWidget {
  const NotificationSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          //   padding: EdgeInsets.all(20),
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
                          Icon(Icons.arrow_back_ios,
                              color: Color(
                                0xff313232,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Notification Settings",
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
                      Get.offAll(() => MenuView());
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Notifications",
                            style: TextStyle(
                              color: Color(
                                0xff313232,
                              ),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Roboto",
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          CupertinoSwitch(
                            value: true,
                            activeColor: ThemeData().primaryColor,
                            onChanged: (value) {
                              //setState(() {
                              //  _switchValue = value;
                              // });
                            },
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                      ),
                      width: 335,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Text(
                        "If you stop notifications, you will not receive updates on your phone.",
                        style: TextStyle(
                          color: Color(
                            0xff898c8c,
                          ),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto",
                        ),
                      ),
                      width: 300,
                      height: 68,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20))
          ])),
    );
  }
}
