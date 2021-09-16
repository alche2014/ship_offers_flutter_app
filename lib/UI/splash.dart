import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipoffers/Controller/splashController.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  final SplashController authController = Get.put(SplashController());
    //  authController.callTohomePage();

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        /* appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Get.snackbar("Hi", "I'm modern snackbar");
          },
        ),
        title: Text("title".trArgs(['John'])),
      ),*/
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width - 200,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                  image: new AssetImage("assets/logo.png"),
                  fit: BoxFit.fill,
                )),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Ship Done Right Since 2001",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Roboto",
                ),
              ),
              Spacer(),
              Text(
                "Powered by The App Guys",
                style: TextStyle(
                  color: Color(
                    0xffe9f0f4,
                  ),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ));
  }
}
