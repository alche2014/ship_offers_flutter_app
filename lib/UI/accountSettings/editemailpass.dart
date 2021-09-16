import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/Controller/userController.dart';
import 'package:shipoffers/UI/home/menu.dart';
import 'package:shipoffers/UI/home/notification.dart';

class EditEmailPassView extends StatelessWidget {
  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    
    emailController.text = userController.user.email!;
    passwordController.text = userController.user.phone!;
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
                            "Edit Profile",
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
              height: 50,
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Email",
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
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                                enabled: false,
                                // obscureText: true,
                                controller: emailController,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Password",
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
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                                enabled: false,
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    //   border: InputBorder.none,
                                    suffixIcon: Icon(Icons.edit),
                                    hintText: "**********"
                                    //     labelText: "Password"
                                    ))))
                  ],
                )),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: FlatButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: "Proflie Edited.",
                      confirm: FlatButton(
                        onPressed: () {
                          Get.back();
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
                              width: MediaQuery.of(context).size.width,
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
          ])),
    );
  }
}
