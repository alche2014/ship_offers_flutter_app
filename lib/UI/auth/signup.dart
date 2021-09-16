import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/Controller/authController.dart';
import 'package:shipoffers/Controller/signupController.dart';
import 'package:shipoffers/UI/auth/login.dart';
import 'package:shipoffers/UI/auth/signup1.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final AuthController controller = Get.put(AuthController());

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(20),
          // margin: EdgeInsets.only(top: 250),
          alignment: Alignment.center,
          child: Center(
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
                    Get.offAll(LoginView());
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Create Your Account",
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
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Choose Profile Picture",
                              style: TextStyle(
                                color: Color(
                                  0xff898c8c,
                                ),
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Calibre",
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 23,
                      ),

                      /// image content of "Profile Picture"
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                controller.imagefile.value == null
                    ? Stack(alignment: Alignment.center, children: <Widget>[
                        CircleAvatar(
                          radius: 90.0,
                          backgroundColor: Color(0xffDCE2E5),
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 90,
                                backgroundImage: AssetImage('assets/p.png'),
                              ),
                              Positioned(
                                  bottom: 4,
                                  right: 8,
                                  child: GestureDetector(
                                      onTap: () {
                                        Get.defaultDialog(
                                            title: "",
                                            content: Container(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    child: Text(
                                                      "Choose photo from either phone storage or camera.",
                                                      style: TextStyle(
                                                        color: Color(
                                                          0xff313232,
                                                        ),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: "Roboto",
                                                      ),
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                                width: 100,
                                                                height: 100,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                    0xfff7f8f9,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    16,
                                                                  ),
                                                                ),
                                                                child: Image.asset(
                                                                    "assets/L.png")),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              "Phone Storage",
                                                              style: TextStyle(
                                                                color: Color(
                                                                  0xff898c8c,
                                                                ),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    "Roboto",
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        onTap: () {
                                                          controller
                                                              .pickFromGallery()
                                                              .then((value) {
                                                            Get.back();
                                                            Get.snackbar(
                                                                'Please Wait Photo is loading ',
                                                                '',
                                                                showProgressIndicator:
                                                                    true);
                                                            setState(() {
                                                              print(controller
                                                                  .imagefile
                                                                  .value);
                                                            });
                                                          });
                                                        },
                                                      ),
                                                      InkWell(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                                width: 100,
                                                                height: 100,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                    0xfff7f8f9,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    16,
                                                                  ),
                                                                ),
                                                                child: Image.asset(
                                                                    "assets/M.png")),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              "Open Camera",
                                                              style: TextStyle(
                                                                color: Color(
                                                                  0xff898c8c,
                                                                ),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    "Roboto",
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        onTap: () {
                                                          controller
                                                              .pickFromCamera()
                                                              .then((value) {
                                                            Get.back();
                                                            Get.snackbar(
                                                                'Please Wait Photo is loading ',
                                                                '',
                                                                showProgressIndicator:
                                                                    true);
                                                            setState(() {
                                                              print(controller
                                                                  .imagefile
                                                                  .value);
                                                            });
                                                          });
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                            ));
                                      },
                                      child: Image.asset(
                                        'assets/Camera.png',
                                        width: 38,
                                        fit: BoxFit.fitWidth,
                                      )))
                            ],
                          ),
                        )
                      ])
                    : Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 90.0,
                            backgroundColor: Color(0xffffffff),
                            backgroundImage:
                                FileImage(controller.imagefile.value!),
                          ),
                          Positioned(
                              bottom: 4,
                              right: 108,
                              child: GestureDetector(
                                  onTap: () {
                                    Get.defaultDialog(
                                        title: "",
                                        content: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                child: Text(
                                                  "Choose photo from either phone storage or camera.",
                                                  style: TextStyle(
                                                    color: Color(
                                                      0xff313232,
                                                    ),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Roboto",
                                                  ),
                                                ),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  InkWell(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                0xfff7f8f9,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                16,
                                                              ),
                                                            ),
                                                            child: Image.asset(
                                                                "assets/L.png")),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          "Phone Storage",
                                                          style: TextStyle(
                                                            color: Color(
                                                              0xff898c8c,
                                                            ),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "Roboto",
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {
                                                      controller
                                                          .pickFromGallery()
                                                          .then((value) {
                                                        Get.back();
                                                        Get.snackbar(
                                                            'Please Wait Photo is loading ',
                                                            '',
                                                            showProgressIndicator:
                                                                true);
                                                        setState(() {
                                                          print(controller
                                                              .imagefile.value);
                                                        });
                                                      });
                                                    },
                                                  ),
                                                  InkWell(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                0xfff7f8f9,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                16,
                                                              ),
                                                            ),
                                                            child: Image.asset(
                                                                "assets/M.png")),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          "Open Camera",
                                                          style: TextStyle(
                                                            color: Color(
                                                              0xff898c8c,
                                                            ),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                "Roboto",
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {
                                                      controller
                                                          .pickFromCamera()
                                                          .then((value) {
                                                        Get.back();
                                                        Get.snackbar(
                                                            'Please Wait Photo is loading ',
                                                            '',
                                                            showProgressIndicator:
                                                                true);
                                                        setState(() {
                                                          print(controller
                                                              .imagefile.value);
                                                        });
                                                      });
                                                    },
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ));
                                  },
                                  child: Image.asset(
                                    'assets/Camera.png',
                                    width: 38,
                                    fit: BoxFit.fitWidth,
                                  )))
                        ],
                      ),
                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email Address",
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
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      //labelText: 'Email',
                                      hintText: 'tienlapspktnd@gmail.com',
                                      errorText: controller.emailValidate.value
                                          ? 'Value Can\'t Be Empty'
                                          : null,
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
                              "Employee Name",
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
                              "Must be at least eight characters.",
                              style: TextStyle(
                                color: Color(
                                  0xff898C8C,
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
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 5),
                                child: TextFormField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Cameron Williamson',
                                      errorText: controller.nameValidate.value
                                          ? 'Value Can\'t Be Empty'
                                          : null,
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
                              "Must be at least eight characters.",
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
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 5),
                                child: TextFormField(
                                    controller: passwordController,
                                    obscureText: controller.colorSwitcher.value,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      suffixIcon: InkWell(
                                          child: Icon(Icons.remove_red_eye,
                                              color:
                                                  controller.colorSwitcher.value
                                                      ? Colors.grey
                                                      : Colors.green),
                                          onTap: () {
                                            if (controller
                                                    .colorSwitcher.value ==
                                                false) {
                                              controller.colorSwitcher.value =
                                                  true;
                                            } else {
                                              controller.colorSwitcher.value =
                                                  false;
                                            }
                                          }),

                                      //labelText: 'Email',
                                      errorText:
                                          controller.passwordValidate.value
                                              ? 'Value Can\'t Be Empty'
                                              : null,
                                      hintText: '********',
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
                              "Confirm Password",
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
                              "Must be at least eight characters.",
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
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 5),
                                child: TextFormField(
                                    obscureText: controller.checked.value,
                                    controller: confirmPasswordController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      suffixIcon: InkWell(
                                          child: Icon(Icons.remove_red_eye,
                                              color: controller.checked.value
                                                  ? Colors.grey
                                                  : Colors.green),
                                          onTap: () {
                                            if (controller.checked.value ==
                                                false) {
                                              controller.checked.value = true;
                                            } else {
                                              controller.checked.value = false;
                                            }
                                          }),

                                      //labelText: 'Email',
                                      errorText: controller
                                              .confirmPasswordValidate.value
                                          ? 'Value Can\'t Be Empty'
                                          : null,
                                      hintText: '********',
                                    ))))
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                FlatButton(
                  onPressed: () {
                    controller.emailController.text = emailController.text;
                    controller.nameController.text = nameController.text;
                    controller.passwordController.text =
                        passwordController.text;

                    controller.callToSignup1Page();
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
              ],
            ),
          ),
        ));
  }
}
