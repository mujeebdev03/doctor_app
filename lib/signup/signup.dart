import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:hospital_batch6/BackEnd/Database.dart';
import 'package:get/get.dart';
import 'package:hospital_batch6/pages/home_doctor.dart';
import 'package:hospital_batch6/signup/login_page.dart';

import 'package:google_sign_in/google_sign_in.dart';

import '../CoreUI/common widgets.dart';

class signup extends StatefulWidget {
  signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController specilizationcontroller = TextEditingController();

  TextEditingController phonenumcontroller = TextEditingController();

  TextEditingController timecontroller = TextEditingController();

  TextEditingController hospitalLoc = TextEditingController();

  TextEditingController name = TextEditingController();

  DataBase authdata = Get.put(DataBase());

  late GoogleSignInAccount _userObjj;

  GoogleSignIn _googleSignIn = GoogleSignIn();

  SignUp() {
    authdata.signUp(
        email: emailcontroller.text,
        password: passwordcontroller.text,
        Spec: specilizationcontroller.text,
        name: name.text,
        phone: phonenumcontroller.text,
        time: timecontroller.text,
        hospital: hospitalLoc.text);
  }

  final formkey = GlobalKey<FormState>();

  var fixheight = SizedBox(
    height: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              commonTextfeild(
                  controller: name,
                  hintText: "name",
                  validation: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Please enter valid name";
                    } else {
                      emailcontroller.text;
                      log("${emailcontroller.text}");
                    }
                  }),
              fixheight,
              commonTextfeild(
                  controller: emailcontroller,
                  hintText: "Email",
                  validation: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Please enter valid email";
                    } else {
                      emailcontroller.text;
                      log("${emailcontroller.text}");
                    }
                  }),
              fixheight,
              commonTextfeild(
                  controller: passwordcontroller,
                  hintText: "Password",
                  validation: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Please enter valid password";
                    } else {
                      passwordcontroller.text;
                      log("${passwordcontroller.text}");
                    }
                  }),
              fixheight,
              commonTextfeild(
                  controller: specilizationcontroller,
                  hintText: "Speciliz",
                  validation: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Please enter valid spec";
                    } else {
                      specilizationcontroller.text;
                      log("${specilizationcontroller.text}");
                    }
                  }),
              fixheight,
              commonTextfeild(
                  controller: phonenumcontroller,
                  hintText: "Phone",
                  validation: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Please enter valid phone";
                    } else {
                      phonenumcontroller.text;
                      log("${phonenumcontroller.text}");
                    }
                  }),
              fixheight,
              commonTextfeild(
                  controller: hospitalLoc,
                  hintText: "Hospital",
                  validation: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Please enter valid Hospital";
                    } else {
                      emailcontroller.text;
                      log("${emailcontroller.text}");
                    }
                  }),
              fixheight,
              Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: MaterialButton(
                  onPressed: (() async {
                    if (formkey.currentState!.validate()) {
                      await SignUp();
                    }
                  }),
                  child: Text("SIGN UP"),
                ),
              ),
              fixheight,
              Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: MaterialButton(
                  onPressed: () async {
                    await _googleSignIn.signIn().then((userData) {
                      log("inside then");
                      _userObjj = userData!;

                      setState(() {
                        // _isLoggedIn = true;
                        print("on3");

                        print("atiq google data $_userObjj");
                      });
                      print("atiq data $_userObjj");
                      String docid, email, name, photo;
                      docid = _userObjj.id.toString();
                      email = _userObjj.email;
                      photo = _userObjj.photoUrl.toString();
                      name = _userObjj.displayName.toString();

                      log("this is  id $docid");
                      log("this is  id $email");
                      log("this is  id $name");
                      log("this is  id $photo");

                      authdata.googlesign(
                          Dr_name: name,
                          Iamge_url: photo,
                          email: email,
                          user_Id: docid);

                      // controller.GoolgeSign(
                      //   docid: docid,
                      //   email: email,
                      //   Name: name,
                      // );
                    }).catchError((e) {
                      print(e);
                    });
                  },
                  child: Text("SIGN UP with Google"),
                ),
              ),
              fixheight,
              Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: MaterialButton(
                  onPressed: () async {
                    await _googleSignIn.signOut();
                  },
                  child: Text("SIGN out with Google"),
                ),
              ),
              fixheight,
              Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: MaterialButton(
                  onPressed: (() async {
                    Get.to(login());
                  }),
                  child: Text("Login Page"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
