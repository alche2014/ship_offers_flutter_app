import 'package:cloud_firestore/cloud_firestore.dart';

class DataModel {
  final String? title;
  final String? content;
  final String? chapter;

  DataModel({this.title, this.content, this.chapter});

  //Create a method to convert QuerySnapshot from Cloud Firestore to a list of objects of this DataModel
  //This function in essential to the working of FirestoreSearchScaffold

  List<DataModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<dynamic, dynamic> dataMap = snapshot.data() as Map;

      return DataModel(
          title: dataMap['title'],
          content: dataMap['content'],
          chapter: dataMap['chapter']);
    }).toList();
  }
}
