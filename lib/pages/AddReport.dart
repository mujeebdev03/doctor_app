import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hospital_batch6/CoreUI/common%20widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart';

import '../CoreUI/commonDialog.dart';

class ReportUpload extends StatefulWidget {
  const ReportUpload({super.key});

  @override
  State<ReportUpload> createState() => _ReportUploadState();
}

class _ReportUploadState extends State<ReportUpload> {
  ImagePicker imagePicker = ImagePicker();
  String? imageurl;
  File? imagedata;

  getImage(
    ImageSource imageSource,
  ) async {
    final img = await imagePicker.pickImage(source: imageSource);
    if (img != null) {
      imagedata = File(img.path);
      log("image data $imagedata");
      log("image url before $imageurl");

      log("image data ${imagedata!.path}");
      //

      await uploadImages();

      log("image url after $imageurl");
    }
  }

  final FirebaseStorage storage = FirebaseStorage.instance;
  uploadImages() async {
    CommonDialog.showDialog();

    try {
      final ref = storage
          .ref()
          .child("P_Report/${DateTime.now().microsecondsSinceEpoch}");
      //Upload the file to firebase
      final uploadTask = await ref.putFile(File(imagedata!.path));

      imageurl = await uploadTask.ref.getDownloadURL();

      setState(() async {
        imageurl = await uploadTask.ref.getDownloadURL();
      });

      print("before assign url $imageurl");

      CommonDialog.hideLoading();

      // Imageurl.text = imageurl!;
      log("profileurl>>>>>>>>>>>>>>>>>>>>>$imageurl");
      // log("Model>>>>>>>>>>>>>>>>>>>>>${Imageurl.text}");
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //pick from local file
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: imageurl == null
                        ? DecorationImage(image: AssetImage("image/doc2.png"))
                        : DecorationImage(
                            image: MemoryImage(imagedata!.readAsBytesSync()))),
              ),
              spacebox(),
              Container(
                //pick from firebase
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: imageurl == null
                        ? DecorationImage(image: AssetImage("image/doc2.png"))
                        : DecorationImage(image: NetworkImage(imageurl!))),
              ),
              TextButton(
                child: Text("Camera"),
                onPressed: () async {
                  await getImage(ImageSource.camera);
                },
              ),
              TextButton(
                child: Text("Gallery"),
                onPressed: () async {
                  await getImage(ImageSource.gallery);
                },
              ),
            ]),
      ),
    );
  }
}
