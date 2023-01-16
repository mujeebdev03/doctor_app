import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hospital_batch6/BackEnd/Database.dart';

import 'package:get/get.dart';

class ApiService extends StatelessWidget {
  ApiService({super.key});

  DataBase apiService = Get.put(DataBase());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 500,
              child: FutureBuilder(
                  future: apiService.get_api(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      log("here is the length ${snapshot.data.length}");
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            dynamic data = snapshot.data[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  data["image"],
                                ),
                              ),
                              title: Text("${data["category"]}"),
                              subtitle: Text("${data["title"]}"),
                            );
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            )
          ],
        ),
      ),
    );
  }
}
