import 'package:cloud_firestore/cloud_firestore.dart';

class ThreadModel {
  String? id;
  String? uid;
  String? uname;
  String? uemail;
  String? title;
  String? content;
  String? location;
  String? uimageURL;
  int? likes;
  int? comments;
  bool? flag;
  Timestamp? date;

  Timestamp? dateTime;

  ThreadModel(
      {this.id,
      this.uname,
      this.uemail,
      this.title,
      this.uimageURL,
      this.content,
      this.comments,
      this.location,
      this.date,
      this.dateTime,
      this.flag,
      this.likes,
      this.uid});

  ThreadModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    uname = documentSnapshot["uname"];
    uemail = documentSnapshot["uemail"];
    uid = documentSnapshot["uid"];
    title = documentSnapshot["title"];
    content = documentSnapshot["content"];
    uimageURL = documentSnapshot["uimageURL"];
    comments = documentSnapshot["comments"];
    location = documentSnapshot["location"];
    date = documentSnapshot["date"];

    flag = documentSnapshot["flag"];
    likes = documentSnapshot["likes"];

    dateTime = documentSnapshot["dateTime"];
  }
}
