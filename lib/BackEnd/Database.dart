import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:hospital_batch6/BackEnd/LocalDataBase.dart';
import 'package:hospital_batch6/pages/home_doctor.dart';
import 'package:hospital_batch6/signup/login_page.dart';

import '../CoreUI/commonDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:http/http.dart' as http;

class DataBase extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _storeData = FirebaseFirestore.instance;
  LocalDatabase _localdataBase = LocalDatabase();

  String dummyImage =
      "https://img.freepik.com/premium-vector/vector-icon-doctor-image-female-doctor-with-stethoscope-medical-uniform-gauze-protective_619989-707.jpg?w=740";

  googlesign({String? user_Id, Dr_name, email, Iamge_url}) async {
    CommonDialog.showDialog();
    await _storeData.collection('App_Users_credentials').doc(user_Id).set({
      'user_Id': user_Id!,
      'Dr_name': Dr_name,
      'email': email,
      'Image_url': Iamge_url,
      'password': "***",
    });
    CommonDialog.hideLoading();
    //serf
    Get.to(doctor_home());
  }

  Future signUp({
    required String email,
    required String password,
    required String Spec,
    // required String imageurl,
    required String name,
    required String phone,
    required String time,
    required String hospital,
  }) async {
    try {
      CommonDialog.showDialog();
      print("Inside the signUp");
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      print(userCredential);

      CommonDialog.hideLoading();
      try {
        CommonDialog.showDialog();
        // final uid = userCredential.user!.uid;
        await _storeData
            .collection('App_Users_credentials')
            .doc(userCredential.user!.uid)
            .set({
          'user_Id': userCredential.user!.uid,
          'Dr_name': name,
          'password': password,
          'email': email,
          'Spec': Spec,
          'Time': time,
          'Image_url': "iamge data",
          'Phone': phone,
          "Hospital_Loc": hospital,
        });

        CommonDialog.hideLoading();

        Get.offAll(login());
      } on FirebaseAuthException catch (e) {
        CommonDialog.hideLoading();
        if (e.code == 'weak-password') {
          CommonDialog.showErrorDialog(
              title: "weak Password",
              description: "The password provided is too weak.");
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          CommonDialog.showErrorDialog(
              title: "Email Exists",
              description:
                  "An existing account is already registered with that email address.");
          print('The account already exists for that email.');
        }
      }
    } catch (e) {
      print(e);
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog(
          description: "Something went wrong", title: e.toString());
    }
  }

  ////////////////Sign In
  Future<void> loginFun({String? email, String? password}) async {
    try {
      CommonDialog.showDialog();
      UserCredential Credential = await _auth.signInWithEmailAndPassword(
        email: email!.trim(),
        password: password!.trim(),
      );

      await _localdataBase.setAppUserRecord(
          useremail: email,
          userid: Credential.user!.uid.toString(),
          islogin: true);

      CommonDialog.hideLoading();

      Get.offAll(doctor_home());
    } on FirebaseAuthException catch (e) {
      CommonDialog.hideLoading();
      if (e.code == 'user-not-found') {
        CommonDialog.showErrorDialog(
            title: "Login Failed",
            description:
                "Your email or password is incorrect.\nPlease try again.");
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CommonDialog.showErrorDialog(
            title: "Login Failed",
            description:
                "Your email or password is incorrect.\nPlease try again.");
        print('Wrong password provided for that user.');
      }
    }
  }

  ////add doctor

  AddDoctor(
      {String? name,
      email,
      exp,
      spec,
      hosName,
      phoneNum,
      stTime,
      enTime}) async {
    CommonDialog.showDialog(title: "Adding Doctor data");
    await _storeData
        .collection("DoctorInfo")
        .doc(DateTime.now().toString())
        .set({
      "Doctorname": name,
      "DocEamil": name,
      "DocExp": exp,
      "DocSpec": spec,
      "HospitalName": hosName,
      "PhoneNumber": phoneNum,
      "stTime": stTime,
      "enTime": enTime,
      "proImage": dummyImage,
    });

    CommonDialog.hideLoading();

    Get.back();
  }

  /////////////////////////////////
  Future get_api() async {
    String url = "https://fakestoreapi.com/products";

    final all_product = Uri.parse(url);

    final response = await http.get(all_product);

    final allbody = response.body;
    print("response code is here ==>${response.statusCode}");

    print("the response is body ==>${response.body}");

    return json.decode(allbody);
  }

  Future NewsApi({int state = 0}) async {
    String uniquekey = "d4387f69586147f3a27d838c41d9a803";
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$uniquekey";
    String url2 =
        "https://newsapi.org/v2/everything?q=tesla&from=2022-11-16&sortBy=publishedAt&apiKey=$uniquekey";

    final all_product = Uri.parse(state == 1 ? url : url2);

    final response = await http.get(all_product);

    final allbody = response.body;
    print("response code is here ==>${response.statusCode}");

    print("the response is body ==>${response.body}");

    return json.decode(allbody);
  }

  Future sendEmail(
      {String? name, String? email, String? message, String? dis}) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    const serviceId = 'service_s8mw63n';
    const templateId = 'template_fr1vm61';
    const userId = 'gy6Q7GXoZo8jUA5KP';
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        }, //This line makes sure it works for all platforms.
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'Diseases': dis,
            'user_email': email,
            'user_name': name,
            'message': message,
          }
        }));
    log(response.statusCode);
    return response.statusCode;
  }
}
