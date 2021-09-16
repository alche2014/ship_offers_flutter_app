import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? dob;
  String? jobRole;
  String? role;
  String? imageURL = "https://www.kindpng.com/picc/m/557-5575215_2020-profile-circle-hd-png-download.png";
  String? phone = "";

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.dob,
      this.imageURL,
      this.jobRole,
      this.phone,
      this.role});

  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
   // id = documentSnapshot.id;
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
    dob = documentSnapshot["dob"];
    jobRole = documentSnapshot["jobRole"];
    role = documentSnapshot["role"];
    imageURL = documentSnapshot["imageURL"];
    phone = documentSnapshot["phone"];
  }
}
