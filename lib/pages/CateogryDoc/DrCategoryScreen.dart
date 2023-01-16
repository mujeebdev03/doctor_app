import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_batch6/pages/CatDoctor_Details/CatDoctorDetails.dart';
import 'package:lottie/lottie.dart';

import '../../CoreUI/common widgets.dart';

class DrCategoryScreen extends StatelessWidget {
  DrCategoryScreen({super.key});

  List<String> DrCat = [
    "Cardiologists",
    "Urologist",
    "Dermatologists",
    "Cardiologists",
    "Urologist",
    "Dermatologists",
    "Cardiologists",
    "Urologist",
    "Dermatologists",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              spacebox(),
              const ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                tileColor: Colors.indigo,
                textColor: Colors.white,
                iconColor: Colors.white,
                leading: Icon(Icons.category),
                title: Text('Doctors Category'),
                subtitle: Text('Below is the List of Available Doctors'),
              ),
              Container(
                child: Lottie.asset('image/drcat.json'),
              ),
              SizedBox(
                  height: 600,
                  child: ListView.builder(
                      itemCount: DrCat.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(ShowCatDoctor(catDocName: DrCat[index]));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: common_listtile(
                              title_text: (DrCat[index]).toString(),
                              subtitle:
                                  ("They’re experts on the heart  vessels")
                                      .toString(),
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    ));
  }
}
