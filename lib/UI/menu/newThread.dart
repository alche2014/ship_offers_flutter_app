import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/Controller/notificationController.dart';
import 'package:shipoffers/Controller/userController.dart';
import 'package:shipoffers/UI/auth/signup.dart';
import 'package:shipoffers/UI/home/bottombar.dart';
import 'package:shipoffers/UI/home/menu.dart';
import 'package:shipoffers/UI/home/notification.dart';
import 'package:shipoffers/model/thread.dart';
import 'package:shipoffers/services/database.dart';
import 'package:video_player/video_player.dart';

class NewThreadView extends StatelessWidget {
  var checked = true;
  Database _database = Database();
  ThreadModel _threadModel = ThreadModel();
  UserController userController = Get.put(UserController());

  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Get.put(SplashController().callTohomePage());
    ListNotificationX dx = Get.put(ListNotificationX());
    return Scaffold(
      body: Container(
        color: Color(0xffEDEFF0),
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(children: [
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
                        Icon(Icons.arrow_back_ios, color: Color(0xff5e6060)),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Create New Thread",
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
                          icon: Icon(CupertinoIcons.bell,
                              color: Color(0xff5e6060)),
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
            padding: EdgeInsets.only(
              top: 30,
              bottom: 30,
            ),
            child: Text(
              "Help share our wins and celebrate our team.",
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
                        "Give a Headline",
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
                          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                          child: TextFormField(
                              controller: titleController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '',
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
                        "Who",
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
                        "Optional",
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
                          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                          child: TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '',
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
                        "Where",
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
                          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                          child: TextFormField(
                              controller: locationController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '',
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
                        "What",
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
                          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                          child: TextFormField(
                              controller: contentController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Write here',
                              ))))
                ],
              )),
          SizedBox(
            height: 30,
          ),
          FlatButton(
            onPressed: () {
              if (nameController.text == null || nameController.text == '') {
                nameController.text = userController.user.name!;
              }

              if (titleController.text == null ||
                  titleController.text == '' ||
                  contentController.text == null ||
                  contentController.text == '' ||
                  locationController.text == null ||
                  locationController.text == '') {
                Get.snackbar('Alert!', "All fields are required.");
              } else {
                _threadModel = ThreadModel(
                  comments: 0,
                  likes: 0,
                  uid: userController.user.id,
                  uemail: userController.user.email,
                  uimageURL: userController.user.imageURL,
                  title: titleController.text,
                  content: contentController.text,
                  uname: nameController.text,
                  location: locationController.text,
                  flag: false,
                );

                _database.addThread(_threadModel);
                // Get.offAll(SignupView1());
                Get.defaultDialog(
                    title: "Submission Successful.",
                    confirm: FlatButton(
                      onPressed: () {
                        Get.back();
                        Get.snackbar('Thank you!', "New thread posted.");
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
                      minWidth: MediaQuery.of(context).size.width,
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
                            width: MediaQuery.of(context).size.width,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width,
                    ));
              }
            },
            child: Text(
              "Post",
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
        ]),
      ),
    );
  }
}
