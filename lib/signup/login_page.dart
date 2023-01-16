import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hospital_batch6/BackEnd/Database.dart';
import 'package:hospital_batch6/signup/signup.dart';
import 'package:lottie/lottie.dart';

import '../CoreUI/common widgets.dart';
import '../pages/home_doctor.dart';

import 'package:get/get.dart';

class login extends StatelessWidget {
  login({super.key});

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  DataBase auth = Get.put(DataBase());
  // String email,password;
  UserLogin() {
    auth.loginFun(
        email: emailcontroller.text, password: passwordcontroller.text);
  }

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 242, 242),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Center(
                child: Container(
                    height: 300,
                    width: 300,
                    child: Lottie.asset('image/ani.json')),
              )),
              Container(
                child: Text(
                  "WELL COME TO",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.blueAccent),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Text(
                  "DOCTOR APP",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.green),
                ),
              ),
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
              SizedBox(
                height: 20,
              ),
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
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 40,
              ),
              InkWell(
                onLongPress: () {},
                child: Text(
                  "forget password?",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Text("Does not have account?"),
              InkWell(
                onTap: () {
                  Get.to(signup());
                },
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.purple),
                child: ElevatedButton(
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      // log("all set textfeild data enter");

                      await UserLogin();
                    }
                  },
                  child: Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
