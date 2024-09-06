import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../../api/api.dart';
import 'package:http/http.dart' as http;
import '../../../profile/views/profile_screen.dart';
import '../view/signinpage.dart';

class SignInController extends GetxController {
  // Variables
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final tokenStorage = FlutterSecureStorage();

  // Login Function

  loginApi(context) async {
    try {
      var url = "${API.fincaURL}/${API.routeURL}/user/login";
      var data = {
        "phone": mobileController.text.toString(),
        "password": passwordController.text.toString()
      };
      var body = json.encode(data);
      var urlParse = Uri.parse(url);
      var response = await http.post(urlParse, body: body, headers: {
        "Content-Type": "application/json",
        'x-API-Key': "${API.APIKey}"
      });

      if (response.statusCode == 200) {
        var data2 = jsonDecode(response.body);

        Get.to(() => Profile_Screen ());
        Fluttertoast.showToast(
          msg: "Sign in Done",
        );
        await tokenStorage.write(key: "token", value: data2["token"]);

        debugPrint(data2.toString());
        print(data2["token"]);
        Get.snackbar("Token", data2["token"].toString());
      } else {
        Get.snackbar("Error", "Not valid user");
      }
    } catch (e) {
      Get.snackbar("Error", "Some thing went wrong");
    }
  }

  // log out api
  void logOut() async {
    Get.snackbar("Token", tokenStorage.toString());

    await tokenStorage.delete(key: "token");
    Get.offAll(() => Signinpage());

    Get.snackbar("Token", tokenStorage.toString());
  }
}
