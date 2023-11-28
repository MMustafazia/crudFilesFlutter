import 'dart:io';

import 'package:crud/pages/database.dart';
import 'package:crud/pages/delete.dart';
import 'package:crud/pages/read.dart';
import 'package:crud/pages/update.dart';
import 'package:crud/pages/uploadimage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  uploadData() async {
    Map<String, dynamic> uploaddata = {
      "First Name:": firstnamecontroller.text,
      "Last Name:": lastnamecontroller.text,
      "Age:": agecontroller.text,
      "Image:": imageUrl,
    };
    await DatabaseMethods().addUserDetails(uploaddata);
    Fluttertoast.showToast(
        msg: "Data Uploaded Successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16);
  }

  String imageUrl = '';

  TextEditingController firstnamecontroller = new TextEditingController();
  TextEditingController lastnamecontroller = new TextEditingController();
  TextEditingController agecontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Create Data"),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text("First name:"),
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
                controller: firstnamecontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "first name",
                  hintStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text("Last name:"),
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
                controller: lastnamecontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "last name",
                  hintStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text("age:"),
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
                controller: agecontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "age",
                  hintStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: IconButton(
                onPressed: () async {
                  ImagePicker imagePicker = ImagePicker();
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  print("${file?.path}");

                  if (file == null) return;

                  String uniqueFileName =
                      DateTime.now().millisecondsSinceEpoch.toString();

                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDirImages = referenceRoot.child("images");
                  Reference referenceImageToUpload =
                      referenceDirImages.child(uniqueFileName);

                  try {
                    await referenceImageToUpload.putFile(File(file!.path));
                    imageUrl = await referenceImageToUpload.getDownloadURL();
                  } catch (e) {}
                },
                icon: Icon(
                  Icons.camera_alt_rounded,
                  size: 30,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                uploadData();
                dispose() {
                  imageUrl;
                }
              },
              child: Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue),
                child: Center(
                  child: Text(
                    "submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Readpage()));
                      },
                      child: Text(
                        "Read Data",
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Imageupload()));
                      },
                      child: Text(
                        "image upload",
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Updatescreen()));
                      },
                      child: Text(
                        "Update Data",
                        style: TextStyle(fontSize: 15, color: Colors.purple),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeleteScreen()));
                      },
                      child: Text(
                        "Delete Data",
                        style: TextStyle(fontSize: 15, color: Colors.red),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
