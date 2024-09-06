import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/api/api.dart';
import 'package:http/http.dart' as http;

import '../../signin/view/signinpage.dart';

class SignupController extends GetxController {
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  var selectedOption = 'User'.obs;

  void setSelectedOption(String option) {
    selectedOption.value = option;
  }

  void customerRegisterApi(BuildContext context) async {
    try {
      var url = "${API.fincaURL}/${API.routeURL}/user/create";
      var data = {
        "password": passController.text,
        "full_name": nameController.text,
        "phone": mobileController.text,
        "email": emailController.text,
        "is_customer": true,
        "is_seller": false
      };
      var body = json.encode(data);
      var urlParse = Uri.parse(url);
      var response = await http.post(urlParse, body: body, headers: {
        "Content-Type": "application/json",
        'x-API-Key': "${API.APIKey}"
      });

      Get.to(() => Signinpage());
      Fluttertoast.showToast(
        msg: "Sign up Done",
      );
    } catch (e) {
      Get.snackbar("Error", "Some thing went wrong");
    }
  }
}
