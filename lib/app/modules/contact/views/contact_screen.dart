import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/utils/app_color.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import '../../../../widgets/custom_textfield.dart';
import '../controller/contact_controller.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});
  final controller = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
        titleSpacing: 0,
        backgroundColor: AppColor.baseColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const CustomText(
                text: "Get In Touch",
                maxline: 1,
                fontsize: 28.0,
                fontweight: FontWeight.bold,
                color: AppColor.baseColor,
              ),
              const SizedBox(height: 15.0),
              const CustomText(
                text:
                "We'd love to hear from you. Fill out the form below and we'll get back to you as soon as possible.",
                maxline: 3,
                fontsize: 16.0,
                color: Colors.black54,
              ),
              const SizedBox(height: 20.0),
              Textfield1(
                hintText: "Your Name",
                controller: controller.nameController,
                onchanged: (value) {
                  controller.name.value = value;
                },
              ),
              const SizedBox(height: 15.0),
              Textfield1(
                hintText: "Your Email",
                controller: controller.emailController,
                onchanged: (value) {
                  controller.email.value = value;
                },
              ),
              const SizedBox(height: 15.0),
              Textfield1(
                hintText: "Subject",
                controller: controller.subjectController,
                onchanged: (value) {
                  controller.subject.value = value;
                },
              ),
              const SizedBox(height: 15.0),
              Textfield1(
                hintText: "Your Phone",
                controller: controller.phoneController,
                inputype: TextInputType.phone,
                onchanged: (value) {
                  controller.phone.value = value;
                },
              ),
              const SizedBox(height: 15.0),
              Textfield1(
                hintText: "Message",
                controller: controller.messageController,
                maxline: 5,
                onchanged: (value) {
                  controller.message.value = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomButton(
                text: "Send Message",
                ontap: () {
                  if (controller.name.value.isNotEmpty &&
                      controller.email.value.isNotEmpty &&
                      controller.subject.value.isNotEmpty &&
                      controller.phone.value.isNotEmpty &&
                      controller.message.value.isNotEmpty) {
                    Fluttertoast.showToast(msg: "Message sent successfully!");
                    // Add your submission logic here
                  } else {
                    Fluttertoast.showToast(
                        msg: "Please fill out all fields.",
                        backgroundColor: Colors.red);
                  }
                },
              ),
              const SizedBox(height: 20.0),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Add your callback logic here
                  },
                  child: const Text(
                    "Need immediate assistance? Contact us directly",
                    style: TextStyle(
                      color: AppColor.baseColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
