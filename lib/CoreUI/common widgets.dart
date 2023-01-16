import 'package:flutter/material.dart';

class commonTextfeild extends StatelessWidget {
  commonTextfeild({
    required this.hintText,
    required this.validation,
    required this.controller,
    Key? key,
  }) : super(key: key);

  String hintText;
  String? Function(String? val)? validation;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextFormField(
        controller: controller,
        validator: validation,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            prefixIcon: Icon(Icons.email),
            hintText: hintText),
      ),
    );
  }
}

class common_listtile extends StatelessWidget {
  common_listtile({
    required this.subtitle,
    required this.title_text,
    Key? key,
  }) : super(key: key);
  String title_text, subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      tileColor: Colors.black54,
      textColor: Colors.white,
      iconColor: Colors.white,
      leading: const Icon(Icons.person),
      title: Text(title_text),
      subtitle: Text(subtitle),
      // onTap: () {
      //   // Get.to(doctor_home());
      // },
    );
  }
}

class spacebox extends StatelessWidget {
  const spacebox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
    );
  }
}
