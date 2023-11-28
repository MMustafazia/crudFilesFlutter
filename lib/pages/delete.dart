import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/pages/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  String? firstname, lastname, age, id;
  TextEditingController textcontroller = new TextEditingController();
  TextEditingController update1Controller = new TextEditingController();
  TextEditingController update2Controller = new TextEditingController();
  TextEditingController update3Controller = new TextEditingController();

  searchUser(String name) async {
    QuerySnapshot querySnapshot = await DatabaseMethods().getuserinfo(name);
    firstname = "${querySnapshot.docs[0]["First Name:"]}";
    lastname = "${querySnapshot.docs[0]["Last Name:"]}";
    age = "${querySnapshot.docs[0]["Age:"]}";
    id = querySnapshot.docs[0].id;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Delete data")),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text("Search here"),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(12)),
              child: TextField(
                controller: textcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search here",
                  hintStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                searchUser(textcontroller.text);
              },
              child: Center(
                child: Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Search",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                await DatabaseMethods().UpdateUserData(update1Controller.text,
                    update2Controller.text, update3Controller.text, id!);
                searchUser(textcontroller.text);
                Fluttertoast.showToast(
                    msg: "Data Updated Successfully!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16);
              },
              child: Center(
                child: Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Update",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                await searchUser(textcontroller.text);
                await DatabaseMethods().DeleteUserData(id!);
                Fluttertoast.showToast(
                    msg: "Data Deleted Successfully!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16);
              },
              child: Center(
                child: Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Delete",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            firstname == null
                ? Container()
                : Center(
                    child: Text(
                      "First Name: " + firstname!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            lastname == null
                ? Container()
                : Center(
                    child: Text(
                      "Last Name: " + lastname!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            age == null
                ? Container()
                : Center(
                    child: Text(
                      "Age: " + age!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(12)),
              child: TextField(
                controller: update1Controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "First Name",
                  hintStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(12)),
              child: TextField(
                controller: update2Controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Last Name ",
                  hintStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(12)),
              child: TextField(
                controller: update3Controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Age",
                  hintStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
