import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../api/api.dart';
import '../views/reset_password.dart';
import 'package:http/http.dart' as http;

class ForgetPasswordController extends GetxController{

   // Variables
  final TextEditingController emailController = TextEditingController();
  final ForgotFormKey = GlobalKey<FormState>();


  // Reset Password

  resetPassword() async {

    try {
      var url = "${API.fincaURL}/${API.routeURL}/user/reset/password";
      var data = {
        "email": emailController.text,

      };
      var body = json.encode(data);
      var urlParse = Uri.parse(url);
      var response = await http.post(urlParse,
          body: body, headers: {"Content-Type": "application/json",'x-API-Key':"${API.APIKey}"});


      var data2 = jsonDecode(response.body);

      Get.to(() => ResetPasswordScreen(email: emailController.text,));



      debugPrint(data2.toString());
      print(data2["token"]);
      Get.snackbar("Token", data2["token"].toString());






    } catch (e) {
      Get.snackbar("Error", "Some thing went wrong");

    }


  }
}