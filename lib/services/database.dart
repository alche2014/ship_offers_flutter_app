import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shipoffers/Controller/userController.dart';
import 'package:shipoffers/constants/firebase.dart';
import 'package:shipoffers/model/thread.dart';
import 'package:shipoffers/model/user.dart';

class Database {
  Future<bool> createNewUser(UserModel user) async {
    try {
      await firebaseFirestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
        "dob": user.dob,
        "role": user.role,
        "jobRole": user.jobRole,
        "imageURL": user.imageURL,
        "phone": user.phone
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await firebaseFirestore.collection("users").doc(uid).get();

      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addTodo(String content, String uid) async {
    try {
      await firebaseFirestore
          .collection("users")
          .doc(uid)
          .collection("todos")
          .add({
        'dateCreated': Timestamp.now(),
        'content': content,
        'done': false,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addHelp(String title, String content) async {
    try {
      String? uid = await auth.currentUser!.uid;
      await firebaseFirestore
          .collection("users")
          .doc(uid)
          .collection("help")
          .add({
        'dateCreated': Timestamp.now(),
        'description': content,
        'title': title,
        'done': false,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addThread(ThreadModel threadModel) async {
    try {
      String? uid = await auth.currentUser!.uid;

      String? uemail = await auth.currentUser!.email;
      String? uimageURL = await auth.currentUser!.photoURL;

      print(uemail! + uimageURL!);
      await firebaseFirestore.collection("threads").add({
        'dateCreated': Timestamp.now(),
        'dateTime': Timestamp.now(),
        'uid': uid,
        'uname': threadModel.uname,
        'title': threadModel.title,
        'done': false,
        'uemail': threadModel.uemail,
        'uimageURL': threadModel.uimageURL,
        'content': threadModel.content,
        'likes': threadModel.likes,
        'comments': threadModel.comments,
        'location': threadModel.location,
        'date': Timestamp.now().toDate(),
        'flag': threadModel.flag
      });
      await firebaseFirestore.collection("notifications").add({
        'type': 'thread',
        'uid': uid,
        'title': threadModel.title,
        'description': 'Your Thread has been created',
        'dateTime': Timestamp.now().toDate(),
        'date': Timestamp.now().toDate(),
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addFlagtoComment(
      bool flag, String commentID, String threadID) async {
    String? uid = await auth.currentUser!.uid;
    try {
      await firebaseFirestore
          .collection("threads")
          .doc(threadID)
          .collection('commentBy')
          .doc(commentID)
          .update({'flag': flag});

      await firebaseFirestore.collection("notifications").add({
        'type': 'flag',
        'uid': uid,
        'title': 'Flag as Approriate',
        'description': 'Thank you for adding comment.',
        'dateTime': Timestamp.now().toDate(),
        'date': Timestamp.now().toDate(),
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addFlag(bool flag, String threadID) async {
    try {
      String? uid = await auth.currentUser!.uid;
      await firebaseFirestore
          .collection("threads")
          .doc(threadID)
          .update({'flag': flag});
      await firebaseFirestore.collection("notifications").add({
        'type': 'flag',
        'uid': uid,
        'title': 'Flag as Approriate',
        'description': 'Thank you for adding comment.',
        'dateTime': Timestamp.now().toDate(),
        'date': Timestamp.now().toDate(),
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addliketoComment(
      String threadID, String commentID, int likes) async {
    try {
      String? uid = await auth.currentUser!.uid;
      UserController userController = Get.put(UserController());
      await firebaseFirestore
          .collection("threads")
          .doc(threadID)
          .collection('commentBy')
          .doc(commentID)
          .collection('likeBy')
          .add({
        'id': uid,
        'email': userController.user.email,
        'imageURL': userController.user.imageURL,
        'name': userController.user.name,
        'date': Timestamp.now().toDate(),
      });
      await firebaseFirestore.collection("notifications").add({
        'type': 'comment',
        'uid': uid,
        'title': 'Thank you for likes.',
        'description': '',
        'dateTime': Timestamp.now().toDate(),
        'date': Timestamp.now().toDate(),
      });
      await firebaseFirestore
          .collection("threads")
          .doc(threadID)
          .collection('commentBy')
          .doc(commentID)
          .update({'likes': likes + 1});
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addlike(String threadID, int likes) async {
    try {
      String? uid = await auth.currentUser!.uid;
      UserController userController = Get.put(UserController());
      String? uemail = await auth.currentUser!.email;
      String? uimageURL = await auth.currentUser!.photoURL;

      print(uemail! + uimageURL!);
      await firebaseFirestore
          .collection("threads")
          .doc(threadID)
          .update({'likes': likes + 1});
      await firebaseFirestore
          .collection("threads")
          .doc(threadID)
          .collection('likeBy')
          .add({
        'id': uid,
        'email': userController.user.email,
        'imageURL': userController.user.imageURL,
        'name': userController.user.name,
        'date': Timestamp.now().toDate(),
      });
      await firebaseFirestore.collection("notifications").add({
        'type': 'like',
        'uid': uid,
        'title': 'Thank you for your likes',
        'description': '',
        'dateTime': Timestamp.now().toDate(),
        'date': Timestamp.now().toDate(),
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addComment(String threadID, String content, int comment) async {
    try {
      String? uid = await auth.currentUser!.uid;

      String? uemail = await auth.currentUser!.email;
      String? uimageURL = await auth.currentUser!.photoURL;
      UserController userController = Get.put(UserController());
      print(uemail! + uimageURL!);
      await firebaseFirestore
          .collection("threads")
          .doc(threadID)
          .update({'comments': comment + 1});
      await firebaseFirestore
          .collection("threads")
          .doc(threadID)
          .collection('commentBy')
          .add({
        'id': uid,
        'email': userController.user.email,
        'imageURL': userController.user.imageURL,
        'name': userController.user.name,
        'content': content,
        'date': Timestamp.now().toDate(),
        'likes': 0,
        'flag': false
      });
      await firebaseFirestore.collection("notifications").add({
        'type': 'comment',
        'uid': uid,
        'title': 'Thank you for adding comment.',
        'description': content,
        'dateTime': Timestamp.now().toDate(),
        'date': Timestamp.now().toDate(),
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

/*
  Stream<List<TodoModel>> todoStream(String uid) {
    return firebaseFirestore
        .collection("users")
        .doc(uid)
        .collection("todos")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<TodoModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(TodoModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
*/

  Future<void> updateUser(UserModel user) async {
    try {
      final String uid = auth.currentUser!.uid;
      firebaseFirestore.collection("users").doc(uid).update(
        {
          "name": user.name,
          "dob": user.dob,
          "jobRole": user.jobRole,
          "phone": user.phone
        },
      );
      Get.find<UserController>().user = await Database().getUser(uid);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> updateUserEmail(String uid, UserModel user) async {
    try {
      firebaseFirestore.collection("users").doc(uid).update(
        {
          "name": user.name,
          "dob": user.dob,
          "jobRole": user.jobRole,
          "phone": user.phone
        },
      );
      Get.find<UserController>().user = await Database().getUser(uid);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> updateTodo(bool newValue, String uid, String todoId) async {
    try {
      firebaseFirestore
          .collection("users")
          .doc(uid)
          .collection("todos")
          .doc(todoId)
          .update({"done": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
