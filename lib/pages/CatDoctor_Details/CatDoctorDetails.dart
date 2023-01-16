import 'package:flutter/material.dart';

import '../../BackEnd/LocalDataBase.dart';

import '../../signup/login_page.dart';

import "package:cloud_firestore/cloud_firestore.dart";

class ShowCatDoctor extends StatelessWidget {
  ShowCatDoctor({required this.catDocName, super.key});

  String catDocName;
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
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: StreamBuilder(
                  stream: _storeData
                      .collection('DoctorInfo')
                      .where("DocSpec", isEqualTo: catDocName)
                      .snapshots(),
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
                                height: 280,
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
                                          style: TextStyle(color: Colors.white),
                                        ),
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
        ));
  }
}
