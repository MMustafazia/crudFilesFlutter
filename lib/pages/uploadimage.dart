import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imageupload extends StatefulWidget {
  const Imageupload({super.key});

  @override
  State<Imageupload> createState() => _ImageuploadState();
}

class _ImageuploadState extends State<Imageupload> {
  String imageUrl = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Upload"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: IconButton(
              onPressed: () async {
                ImagePicker imagePicker = ImagePicker();
                XFile? file =
                    await imagePicker.pickImage(source: ImageSource.camera);
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
        ],
      ),
    );
  }
}
