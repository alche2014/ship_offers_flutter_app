import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  var checked = true;

  @override
  Widget build(BuildContext context) {
    // Get.put(SplashController().callTohomePage());
    return Scaffold(

        /* appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Get.snackbar("Hi", "I'm modern snackbar");
          },
        ),
        title: Text("title".trArgs(['John'])),
      ),*/
        body: Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: ListView(
          children: [],
        ),
      ),
    ));
  }
}
