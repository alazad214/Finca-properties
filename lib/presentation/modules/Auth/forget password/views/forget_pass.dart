import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/Auth/forget%20password/controller/forget_password_controller.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import '../../../../../widgets/custom_textfield.dart';

class ForgetPass extends StatelessWidget {
  ForgetPass({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text("PASSWORD RECOVERY"),
        titleSpacing: 0.0,
      ),
      body: Form(
        key: controller.ForgotFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          child: Column(
            children: [
              const CustomText(
                text:
                    "Please enter a valid email in field an press 'SEND' button. An automated email shall be genarated to be spacified email address with intructions of resetting password.",
                fontsize: 18.0,
                maxline: 10,
                fontweight: FontWeight.w500,
                color: Colors.black54,
              ),
              const SizedBox(height: 20.0),
              Textfield1(

                hinttext: "email",

                controller: controller.emailController,
                hintText:"email",

                suffixicon: Icons.email_outlined,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email address';
                  }
                  final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                  if (!emailRegExp.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const Spacer(),
              CustomButton(
                text: "Submit",
                ontap: () {
                  if (controller.emailController.text.isNotEmpty ||
                      controller.ForgotFormKey.currentState!.validate()) {
                    controller.resetPassword();

                    controller.emailController.clear();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
