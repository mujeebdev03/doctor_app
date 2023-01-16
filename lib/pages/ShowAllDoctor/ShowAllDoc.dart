import 'package:flutter/material.dart';
import 'package:hospital_batch6/CoreUI/commonDialog.dart';

import '../../BackEnd/LocalDataBase.dart';

import '../../CoreUI/common widgets.dart';
import '../../signup/login_page.dart';
import "package:get/get.dart";

import "package:cloud_firestore/cloud_firestore.dart";

class ShowAllDoc extends StatelessWidget {
  ShowAllDoc({super.key});

  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController Specilizationcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();
  final _storeData = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          child: ListView(padding: EdgeInsets.zero, children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey.shade300),
              child: Column(
                children: [
                  Text(
                    "DOCTOR APP ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: CircleAvatar(
                          backgroundImage: AssetImage("image/im1.jpeg"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "ZEESHAN",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text("Zee....gmail.com"),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        leading: Icon(Icons.star),
                        title: Text(
                          "Profile",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        leading: Icon(Icons.star),
                        title: Text(
                          "Favorite",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        leading: Icon(Icons.star),
                        title: Text(
                          "Special Offer",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        leading: Icon(Icons.star),
                        title: Text(
                          "Settings",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20)),
                  child: MaterialButton(
                    onPressed: (() {
                      LocalDatabase().cleardatabase();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => login()));
                    }),
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app_outlined),
                        Text("SIGN OUT"),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
        appBar: AppBar(
          title: const Text("Welcome to Doctor App"),
        ),
        body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: StreamBuilder(
                    stream: _storeData.collection('DoctorInfo').snapshots(),
                    // stream: db.doc("valuRIO")
                    builder: (context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              print(snapshot.data.docs.length);
                              var FatchData = snapshot.data.docs[index];
                              return InkWell(
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  // height: 280,
                                  width: 345,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 177, 177, 177),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 55,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              radius: 50,
                                              backgroundImage: NetworkImage(
                                                  FatchData['proImage']),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Text(
                                              "${FatchData['Doctorname']}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Text(
                                            "Experence: ${FatchData['DocExp']} \n Specilization:  ${FatchData['DocSpec']}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          spacebox(),
                                          spacebox(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                height: 30,
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      Get.defaultDialog(
                                                          title: "Update Data",
                                                          backgroundColor:
                                                              Colors.grey,
                                                          titleStyle: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                          textConfirm: "Update",
                                                          onConfirm: () async {
                                                            await _storeData
                                                                .collection(
                                                                    "DoctorInfo")
                                                                .get()
                                                                .then(
                                                                    (value) async {
                                                              var name = value
                                                                  .docs
                                                                  .map((doc) {
                                                                return doc.id;
                                                              }).toList();
                                                              print(
                                                                  "this is id list $name");

                                                              await _storeData
                                                                  .collection(
                                                                      "DoctorInfo")
                                                                  .doc(name[
                                                                      index])
                                                                  .update({
                                                                "Doctorname":
                                                                    Emailcontroller
                                                                        .text,
                                                                "DocSpec":
                                                                    Specilizationcontroller
                                                                        .text,
                                                              });
                                                              CommonDialog
                                                                  .hideLoading();
                                                              Emailcontroller
                                                                  .clear();
                                                              Specilizationcontroller
                                                                  .clear();
                                                              // for (int i = 0; i < name.length; i++) {
                                                              //   FirebaseFirestore.instance
                                                              //       .collection("collectionName")
                                                              //       .doc(name[i])
                                                              //       .update({"token": fcmToken,});
                                                              // }
                                                            });

                                                            // if (formkey
                                                            //     .currentState!
                                                            //     .validate()) {
                                                            //   print(
                                                            //       "hiiiii vaild");

                                                            //   // log("all set textfeild data enter");

                                                            // }
                                                          },
                                                          textCancel: "Cancel",
                                                          cancelTextColor:
                                                              Colors.white,
                                                          confirmTextColor:
                                                              Colors.white,
                                                          buttonColor:
                                                              Colors.green,
                                                          barrierDismissible:
                                                              false,
                                                          radius: 50,
                                                          content: Column(
                                                            children: [
                                                              SizedBox(
                                                                height: 70,
                                                                child:
                                                                    commonTextfeild(
                                                                        hintText:
                                                                            "Email",
                                                                        validation:
                                                                            (value) {
                                                                          if (value!.isEmpty ||
                                                                              value == null) {
                                                                            return "Please enter valid email";
                                                                          } else {
                                                                            Emailcontroller.text;
                                                                          }
                                                                        },
                                                                        controller:
                                                                            Emailcontroller),
                                                              ),
                                                              commonTextfeild(
                                                                  hintText:
                                                                      "Spec",
                                                                  validation:
                                                                      (value) {
                                                                    if (value!
                                                                            .isEmpty ||
                                                                        value ==
                                                                            null) {
                                                                      return "Please enter valid Spec";
                                                                    } else {
                                                                      Specilizationcontroller
                                                                          .text;
                                                                    }
                                                                  },
                                                                  controller:
                                                                      Specilizationcontroller)
                                                            ],
                                                          ));
                                                    },
                                                    child: Text("Updata Data")),
                                              ),

                                              //////////////////////////Delete data
                                              ///
                                              SizedBox(
                                                height: 30,
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      Get.defaultDialog(
                                                          onConfirm: () async {
                                                            await _storeData
                                                                .collection(
                                                                    "DoctorInfo")
                                                                .get()
                                                                .then(
                                                                    (value) async {
                                                              var name = value
                                                                  .docs
                                                                  .map((doc) {
                                                                return doc.id;
                                                              }).toList();
                                                              print(
                                                                  "this is id list $name");

                                                              await _storeData
                                                                  .collection(
                                                                      "DoctorInfo")
                                                                  .doc(name[
                                                                      index])
                                                                  .delete();
                                                            });
                                                            CommonDialog
                                                                .hideLoading();
                                                          },
                                                          title: "Delete Data",
                                                          backgroundColor:
                                                              Colors.grey,
                                                          titleStyle: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                          middleTextStyle:
                                                              TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                          textConfirm: "Delete",
                                                          textCancel: "Cancel",
                                                          cancelTextColor:
                                                              Colors.white,
                                                          confirmTextColor:
                                                              Colors.white,
                                                          buttonColor:
                                                              Colors.red,
                                                          barrierDismissible:
                                                              false,
                                                          radius: 50,
                                                          content: Text(
                                                              "Are you sure to delete this data!!"));
                                                    },
                                                    child: Text("Delete Data")),
                                              ),
                                            ],
                                          ),
                                          spacebox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                //  onTap: ()
                                //       {  Navigator.pushNamed(context, "mainpage"); },
                              );
                            });
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
