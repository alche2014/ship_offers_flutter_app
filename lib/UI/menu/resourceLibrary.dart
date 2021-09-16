import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/Controller/notificationController.dart';
import 'package:shipoffers/UI/auth/signup.dart';
import 'package:shipoffers/UI/home/bottombar.dart';
import 'package:shipoffers/UI/home/menu.dart';
import 'package:shipoffers/UI/home/notification.dart';
import 'package:video_player/video_player.dart';

class ResourceLibraryView extends StatelessWidget {
  var checked = true;

  @override
  Widget build(BuildContext context) {
    // Get.put(SplashController().callTohomePage());
    ListNotificationX dx = Get.put(ListNotificationX());
    return Scaffold(
      body: Container(
        color: Color(0xffEDEFF0),
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
                            "Resource Library",
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
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Container(
                child: Row(
                  children: [
                    /// Detected as Icon
                    /// FIXME: Check your design. this is an icon of node "Name=search, Size=M". we couldn't any matching flutter native icon, so we uploaded the asset to the cloud, load from it.
                    Icon(
                      Icons.search,
                      color: Color(
                        0xff5e6060,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Search Here",
                      style: TextStyle(
                        color: Color(
                          0xff5e6060,
                        ),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                ),
                width: 119,
                padding: EdgeInsets.all(
                  5,
                ),
              ),
              width: MediaQuery.of(context).size.width,
            ),
            Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Container(
                  height: 50,
                  child: GetBuilder<ListNotificationX>(
                    builder: (_dx) => ListView.builder(
                        itemCount: _dx.numbers.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                              child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  child: Text(
                                    "Customer Service",
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
                                  decoration: BoxDecoration(
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
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ));
                        }),
                  ),
                )),
            Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Container(
                  height: 650,
                  child: GetBuilder<ListNotificationX>(
                    builder: (_dx) => ListView.builder(
                        itemCount: _dx.numbers.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              height: 280,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  )),
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://codetea.com/content/images/2017/03/0170303162038.jpg'),
                                            fit: BoxFit.fitWidth)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    alignment: Alignment.topLeft,
                                    child: Text("How To Use The App"),
                                  )
                                ],
                              ));
                        }),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
