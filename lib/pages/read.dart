import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/pages/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Readpage extends StatefulWidget {
  const Readpage({super.key});

  @override
  State<Readpage> createState() => _ReadpageState();
}

class _ReadpageState extends State<Readpage> {
  String? firstname, lastname, age, id;
  TextEditingController textcontroller = new TextEditingController();

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
      appBar: AppBar(
        title: Center(child: Text("Read Data")),
      ),
      body: Column(
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
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              await DatabaseMethods()
                  .UpdateUserData("Mustafa2", "Mughal", "21", id!);
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
            height: 50,
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
                )
        ],
      ),
    );
  }
}
