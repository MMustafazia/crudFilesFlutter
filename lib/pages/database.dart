import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc()
        .set(userInfoMap);
  }

  Future<QuerySnapshot> getuserinfo(String name) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("First Name:", isEqualTo: name)
        .get();
  }

  Future UpdateUserData(
      String firstname, String lastname, String age, String id) async {
    return await FirebaseFirestore.instance.collection("users").doc(id).update(
      {
        "First Name:": firstname,
        "Last Name:": lastname,
        "Age:": age,
      },
    );
  }

  Future DeleteUserData(String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .delete();
  }
}
