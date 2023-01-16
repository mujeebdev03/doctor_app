import 'package:flutter/material.dart';
import 'package:hospital_batch6/ApiService/ApiService.dart';
import 'package:hospital_batch6/ApiService/Newsapi.dart';
import 'package:hospital_batch6/BackEnd/LocalDataBase.dart';
import 'package:hospital_batch6/CoreUI/common%20widgets.dart';
import 'package:hospital_batch6/pages/AddDoctor/addDoctor.dart';
import 'package:hospital_batch6/pages/AddReport.dart';
import 'package:hospital_batch6/pages/CateogryDoc/DrCategoryScreen.dart';
import 'package:hospital_batch6/pages/ShowAllDoctor/ShowAllDoc.dart';
import 'package:hospital_batch6/signup/signup.dart';

import '../Email/Sendreport.dart';
import '../signup/login_page.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class doctor_home extends StatelessWidget {
  doctor_home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: MaterialButton(
              onPressed: () {
                Get.to(AddDoctor());
              },
              child: Text(
                "Add Doctor",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: MaterialButton(
              onPressed: () {
                Get.to(ShowAllDoc());
              },
              child: Text(
                "Show Doctor",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          spacebox(),
          Center(
            child: MaterialButton(
              onPressed: () {
                Get.to(DrCategoryScreen());
              },
              child: Text(
                "Dr Category",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          spacebox(),
          Center(
            child: MaterialButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();

                prefs.clear();
                Get.offAll(signup());
              },
              child: Text(
                "Log out",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          spacebox(),
          // Center(
          //   child: MaterialButton(
          //     onPressed: () async {
          //       SharedPreferences prefs = await SharedPreferences.getInstance();

          //       prefs.clear();
          //       Get.to(ReportUpload());
          //     },
          //     child: Text(
          //       "Select Image",
          //       style: TextStyle(fontSize: 25),
          //     ),
          //   ),
          // ),
          spacebox(),
          // Center(
          //   child: MaterialButton(
          //     onPressed: () async {
          //       Get.to(EmailSend());
          //     },
          //     child: Text(
          //       "Send Email",
          //       style: TextStyle(fontSize: 25),
          //     ),
          //   ),
          // ),
          spacebox(),
          // Center(
          //   child: MaterialButton(
          //     onPressed: () async {
          //       // SharedPreferences prefs = await SharedPreferences.getInstance();

          //       // prefs.clear();
          //       Get.to(ApiService());
          //     },
          //     child: Text(
          //       "ApiCall",
          //       style: TextStyle(fontSize: 25),
          //     ),
          //   ),
          // ),
          spacebox(),
          // Center(
          //   child: MaterialButton(
          //     onPressed: () async {
          //       // SharedPreferences prefs = await SharedPreferences.getInstance();

          //       // prefs.clear();
          //       Get.to(NewsApi(
          //         newsData: true,
          //       ));
          //     },
          //     child: Text(
          //       "Newsapi",
          //       style: TextStyle(fontSize: 25),
          //     ),
          //   ),
          // ),
          spacebox(),
          // Center(
          //   child: MaterialButton(
          //     onPressed: () async {
          //       // SharedPreferences prefs = await SharedPreferences.getInstance();

          //       // prefs.clear();
          //       Get.to(NewsApi(
          //         newsData: false,
          //       ));
          //     },
          //     child: Text(
          //       "Tesla News",
          //       style: TextStyle(fontSize: 25),
          //     ),
          //   ),
          // ),
        ],
      ),
    ));
  }
}
