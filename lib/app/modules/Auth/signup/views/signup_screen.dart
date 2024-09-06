import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/app/modules/Auth/signup/views/user_signup.dart';

import 'package:universe_it_project/widgets/back_app_bar.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import '../../../../../utils/app_string.dart';
import '../../../../../widgets/custom_button.dart';
import '../controller/signup_controller.dart';
import '../widgets/signup_select_option.dart';
import 'company_signup.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final controller = Get.put(SignupController());
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Backappbar(
        title: 'Register',
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        return SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                children: [
                  CustomText(
                    text: 'Register Now',
                    fontsize: 25.0,
                  ),

                  CustomText(
                    text: AppString.signupWelcome,
                    color: Colors.teal,
                    fontsize: 14.0,
                    maxline: 5,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  SignupSelectOption(),
                  SizedBox(height: 10),
                  if (controller.selectedOption.value == 'User')
                    UserRegistrationForm()
                  else
                    CompanySignup(),
                  SizedBox(height: 20.0),

                  ///Submit Button--->
                  CustomButton(
                    text: "REGISTER",
                    ontap: () {
                      if (controller.selectedOption.value == "User") {
                        if (formkey.currentState!.validate()) {
                          controller.customerRegisterApi(context);

                          controller.nameController.clear();
                          controller.emailController.clear();
                          controller.passController.clear();
                          controller.mobileController.clear();
                          controller.confirmPassController.clear();
                        }
                      }
                    },
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: "You have allready account?   ",
                        color: Colors.black,
                        fontsize: 16.0,
                      ),
                      InkWell(
                        onTap: () => Get.toNamed('/signin_screen'),
                        child: const CustomText(
                          text: "Log In",
                          color: Colors.teal,
                          fontsize: 17.0,
                          fontweight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
