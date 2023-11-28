import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class testing extends StatefulWidget {
  const testing({super.key});

  @override
  State<testing> createState() => _testingState();
}

class _testingState extends State<testing> {
  String imageUrl = '';
  File? file1;
  ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              _showDialog(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 7),
              height: 200,
              width: 170,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade400,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey.shade200,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: file1 == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            color: Colors.grey.shade400,
                            size: 50,
                          ),
                          Text(
                            "Add Picture to your \n post",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    : Image.file(
                        file1!,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getcam1() async {
    // ignore: unused_local_variable
    var img = await image.pickImage(source: ImageSource.camera);
    setState(() {
      file1 = File(img!.path);
    });
    ImagePicker imagePicker = ImagePicker();
    XFile? file = img;
    print("${file?.path}");

    if (file == null) return;

    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child("test");
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    try {
      await referenceImageToUpload.putFile(File(file!.path));
      imageUrl = await referenceImageToUpload.getDownloadURL();
      Fluttertoast.showToast(
          msg: "Data Updated Successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16);
    } catch (e) {}
  }

  getgall1() async {
    // ignore: unused_local_variable
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file1 = File(img!.path);
    });

    ImagePicker imagePicker = ImagePicker();
    XFile? file = img;
    print("${file?.path}");

    if (file == null) return;

    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child("test");
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    try {
      await referenceImageToUpload.putFile(File(file!.path));
      imageUrl = await referenceImageToUpload.getDownloadURL();
      Fluttertoast.showToast(
          msg: "Data Updated Successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16);
    } catch (e) {}
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.amber),
                  child: TextButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.photo,
                          color: Colors.white,
                        ),
                        Text(
                          'Gallery',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      // Perform action for Option 1
                      getgall1(); // Close the dialog
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.amber),
                  child: TextButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera,
                          color: Colors.white,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      // Perform action for Option 2
                      getcam1(); // Close the dialog
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
