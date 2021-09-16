import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/Controller/authController.dart';
import 'package:shipoffers/Controller/signupController.dart';
import 'package:shipoffers/UI/auth/otp.dart';
import 'package:shipoffers/UI/auth/signup.dart';

class SignupView1 extends GetWidget<AuthController> {
  String jobRole = "";

  @override
  Widget build(BuildContext context) {
    final SignInPageController authController = Get.put(SignInPageController());
    final AuthController authController2 = Get.put(AuthController());

    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          // margin: EdgeInsets.only(top: 250),

          child: ListView(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
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
                          "Back",
                          style: TextStyle(
                            color: Color(
                              0xff898c8c,
                            ),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),
                  onTap: () {
                    Get.offAll(() => SignupView());
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    "Employee Information",
                    style: TextStyle(
                      color: Color(
                        0xff59addf,
                      ),
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Color(0xffF2F6FA),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 5),
                                child: TextFormField(
                                    controller: controller.dateController,
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1940, 1),
                                        lastDate: DateTime(2021, 12),
                                      ).then((pickedDate) {
                                        //do whatever you want
                                        print(pickedDate);
                                        var parts =
                                            pickedDate.toString().split(" ");
                                        controller.dateController.text =
                                            parts[0];
                                        print(parts[0]);
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,

                                      //labelText: 'Email',
                                      hintText: 'Jan 21,2002',
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
                              "Your Job Role",
                              style: TextStyle(
                                color: Color(
                                  0xff313232,
                                ),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xffF2F6FA),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 5),
                                child: new DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                  items: <String>[
                                    'Owner',
                                    'Sales',
                                    'Account Management',
                                    'Customer Service Rep',
                                    'Finance',
                                    'Admin',
                                    'IT',
                                    'Op Logs',
                                    'Warehouse'
                                  ].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    jobRole = value!;
                                  },
                                )))
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                FlatButton(
                  onPressed: () async {
                    Get.snackbar("Please Wait",
                        'We are working on your Registration.',
                        snackPosition: SnackPosition.TOP,
                        showProgressIndicator: true);
                    await controller.createUser(
                      jobRole,
                      controller.dateController.text,
                    );
                   
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
              ])),
    );
  }
}
