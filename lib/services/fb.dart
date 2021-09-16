import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shipoffers/Controller/authController.dart';

class fb {
  var token;
  final AuthController authController = Get.put(AuthController());

  Map<String, dynamic>? _userData;
  loginfb() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: [
          'public_profile',
          'email',
          'user_birthday',
          'user_gender',
        ],
      );
      Get.snackbar('Loading', 'Please Wait.');
      // by default we request the email and the public profile
// or FacebookAuth.i.login()
      Get.defaultDialog(
          title: 'Loading',
          content: Center(child: CircularProgressIndicator()));

      if (result.status == LoginStatus.success) {
        // you are logged
        final AccessToken accessToken = result.accessToken!;
        Get.snackbar('Loading', 'Please Wait.');
        token = accessToken.token;
        final userData = await FacebookAuth.instance.getUserData();
        print(userData);
        _userData = userData;

        authController.nameController.text = _userData!["name"];
        authController.emailController.text = _userData!["email"];
        authController.imageURL = _userData!["picture"]["data"]["url"];
        authController.dateController.text = "";

        authController.createFbUser(accessToken.token);
      }
    } catch (e) {
      Get.snackbar('Cancelled', 'Try Again');
    }
//    var url = Uri.https('https://graph.facebook.com',
//        '/v2.12/me?fields=name,first_name,last_name,email&access_token=$token');
//    final response = await http.get(url);
//    final profile = jsonDecode(response.body);
//    print(profile);
//    return profile;
  }
}

class google {
  final AuthController authController = Get.put(AuthController());
  var token, accessToken;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  signinGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      accessToken = googleAuth.accessToken;

      token = googleAuth.idToken;
      Get.snackbar('Loading', 'Please Wait.');
      // by default we request the email and the public profile
// or FacebookAuth.i.login()
      Get.defaultDialog(
          title: 'Loading',
          content: Center(child: CircularProgressIndicator()));

      authController.nameController.text = googleUser.displayName!;
      authController.emailController.text = googleUser.email;
      authController.imageURL = googleUser.photoUrl;
      authController.dateController.text = "";

      authController.createGoogleUser(googleAuth);
    } catch (e) {
      Get.snackbar('Cancelled', 'Try Again');
    }
  }
}
