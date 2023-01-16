import 'package:flutter/material.dart';
import 'package:hospital_batch6/CoreUI/common%20widgets.dart';

import 'package:get/get.dart';

import '../BackEnd/Database.dart';

class EmailSend extends StatelessWidget {
  EmailSend({super.key});

  DataBase emailApi = Get.put(DataBase());
  TextEditingController email = TextEditingController();
  TextEditingController Dis = TextEditingController();
  TextEditingController Name = TextEditingController();
  TextEditingController Message = TextEditingController();
  var fixsize = spacebox();
  Widget commontexfeild({TextEditingController? controller, String? hintText}) {
    return SizedBox(
      width: 350,
      child: TextFormField(
        controller: controller,
        // validator: validation,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            prefixIcon: Icon(Icons.email),
            hintText: hintText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
        children: [
          Text("Send Report"),
          fixsize,
          fixsize,
          fixsize,
          fixsize,
          commontexfeild(controller: Name, hintText: "Name"),
          fixsize,
          commontexfeild(controller: email, hintText: "Email"),
          fixsize,
          commontexfeild(controller: Dis, hintText: "Dsisea"),
          fixsize,
          commontexfeild(controller: Message, hintText: "Message"),
          fixsize,
          fixsize,
          fixsize,
          MaterialButton(
            onPressed: () async {
              if (Message.text == "" && email.text == "") {
                Get.snackbar("Empty EMail", "enter email please");
              } else {
                var response = await emailApi.sendEmail(
                    dis: Dis.text,
                    email: email.text,
                    message: Message.text,
                    name: Name.text);

                response == 200
                    ? Get.snackbar("EMail Send", "Check email box",
                        backgroundColor: Colors.green)
                    : Get.snackbar("EMail Error", "Found some issue",
                        backgroundColor: Colors.red);
              }
            },
            child: Text("Send Report"),
          )
        ],
      ))),
    ));
  }
}
