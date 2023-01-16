import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_batch6/BackEnd/LocalDataBase.dart';
import 'package:hospital_batch6/pages/home_doctor.dart';
import 'package:lottie/lottie.dart';

import '../signup/login_page.dart';
import '../signup/signup.dart';

class splash extends StatefulWidget {
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  final LocalDatabase _localDatabase = LocalDatabase();
  @override
  void didChangeDependencies() async {
    var user_Data = await _localDatabase.getUserid();

    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // String islogin = prefs.get("Userid").toString();

    log("this is user data $user_Data");
    if (user_Data == null) {
      await Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => login(),
            ));
      });
      // Timer(const Duration(seconds: 3), () {
      //   print("thsi is first one");

      // });
    } else if (user_Data != null) {
      Timer(const Duration(seconds: 2), () {
        print("thsi is second one");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => doctor_home(),
            ));
      });
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => login(),
          ));
    }
  }

  // TODO: implement didChangeDependencies

  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 3), () {
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => login(),
  //         ));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Lottie.asset('image/docload.json'),
        ),
      ),
    );
  }
}
