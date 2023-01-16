import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hospital_batch6/BackEnd/Database.dart';

import 'package:get/get.dart';
import 'package:hospital_batch6/CoreUI/common%20widgets.dart';

var imageData =
    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/2048px-No_image_available.svg.png";

class NewsApi extends StatelessWidget {
  NewsApi({required this.newsData, super.key});
  bool newsData;

  DataBase apiService = Get.put(DataBase());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                  future: apiService.NewsApi(state: newsData == true ? 1 : 2),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      log("here is the length ${snapshot.data.length}");
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data["articles"].length,
                          itemBuilder: (context, index) {
                            dynamic data = snapshot.data["articles"][index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: data["urlToImage"] == null
                                                ? NetworkImage(imageData)
                                                : NetworkImage(
                                                    data["urlToImage"])),
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Author:"),
                                          Text("Author:"),
                                        ],
                                      ),
                                      spacebox(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("title:"),
                                          Text("Author:"),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
