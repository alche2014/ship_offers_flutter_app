import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/Controller/userController.dart';
import 'package:shipoffers/UI/home/menu.dart';
import 'package:shipoffers/UI/home/notification.dart';
import 'package:shipoffers/model/user.dart';
import 'package:shipoffers/services/database.dart';

class EditProfile extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Database db = Database();
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    nameController.text = userController.user.name!;
    phoneController.text = userController.user.phone!;
    dob.text = userController.user.dob!;
    job.text = userController.user.jobRole!;
    return Scaffold(
      body: Container(
          //   padding: EdgeInsets.all(20),
          // margin: EdgeInsets.only(top: 250),
          color: ThemeData().primaryColor,
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
                                    0xffffffff,
                                  )),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Edit Profile",
                                style: TextStyle(
                                  color: Color(
                                    0xffffffff,
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
                                      0xffffffff,
                                    )),
                                onPressed: () {
                                  Get.offAll(() => NotificationView());
                                }),
                            IconButton(
                                icon: Icon(Icons.menu,
                                    color: Color(
                                      0xffffffff,
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
                  height: 10,
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              userController.user.imageURL!,
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
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userController.user.name!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Roboto",
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                userController.user.jobRole!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height - 240,
                    color: Colors.white,
                    child: ListView(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "User Name",
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
                                        //  color: Color(0xffF2F6FA),
                                        // borderRadius: new BorderRadius.circular(10.0),
                                        ),
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15, top: 5),
                                        child: TextFormField(
                                            // obscureText: true,
                                            controller: nameController,
                                            decoration: InputDecoration(
                                              suffixIcon: Icon(
                                                Icons.edit,
                                              ),

                                              // labelText: 'Email',
                                            ))))
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Date of Birth",
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
                                        //   color: Color(0xffF2F6FA),
                                        //  borderRadius: new BorderRadius.circular(10.0),
                                        ),
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15, top: 5),
                                        child: TextFormField(
                                            onTap: () {
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2009, 1),
                                                lastDate: DateTime(2021, 12),
                                              ).then((pickedDate) {
                                                //do whatever you want
                                                print(pickedDate);
                                                var parts = pickedDate
                                                    .toString()
                                                    .split(" ");
                                                dob.text = parts[0];
                                                print(parts[0]);
                                              });
                                            },
                                            controller: dob,
                                            decoration: InputDecoration(
                                                //   border: InputBorder.none,
                                                suffixIcon: Icon(Icons.edit),
                                                hintText: "July 14,1890"
                                                //     labelText: "Password"
                                                ))))
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Designation",
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
                                        //  color: Color(0xffF2F6FA),
                                        // borderRadius: new BorderRadius.circular(10.0),
                                        ),
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15, top: 5),
                                        child: TextFormField(
                                            // obscureText: true,
                                            controller: job,
                                            decoration: InputDecoration(
                                                suffixIcon: Icon(
                                                  Icons.edit,
                                                ),
                                                hintText: "UX designer"
                                                // labelText: 'Email',
                                                ))))
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Phone Number",
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
                                        //   color: Color(0xffF2F6FA),
                                        //  borderRadius: new BorderRadius.circular(10.0),
                                        ),
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15, top: 5),
                                        child: TextFormField(
                                            controller: phoneController,
                                            decoration: InputDecoration(
                                              //   border: InputBorder.none,
                                              suffixIcon: Icon(Icons.edit),
                                              //   hintText: "+000-123456777"
                                              //     labelText: "Password"
                                            ))))
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: FlatButton(
                            onPressed: () async {
                              UserModel user = UserModel(
                                  name: nameController.text.trim(),
                                  dob: dob.text.trim(),
                                  jobRole: job.text.trim(),
                                  phone: phoneController.text.trim());
                              await db.updateUser(user);
                              Get.defaultDialog(
                                  title: "Proflie Edited.",
                                  confirm: FlatButton(
                                    onPressed: () {
                                      Get.offAll(MenuView());
                                    },
                                    child: Text(
                                      "Save",
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
                                            "Proflie Edited. Thank you.",
                                            style: TextStyle(
                                              color: Color(
                                                0xff313232,
                                              ),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Roboto",
                                            ),
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                  ));

                              //  Get.offAll(SignupView1());
                            },
                            child: Text(
                              "Continue",
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
                        )
                      ],
                    )),
              ])),
    );
  }
}
