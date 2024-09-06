import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../widgets/back_app_bar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../add property/widgets/custom_text_icon.dart';
import '../controller/image_controller.dart';
import '../controller/profile_controller.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final controller = Get.put(ProfileController());
  final imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Backappbar(title: 'Edit Profile'),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile Image
                Align(
                  alignment: Alignment.center,
                  child: Obx(() {
                    return GestureDetector(
                      onTap: () => imageController.pickImage(),
                      child: Stack(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              border: Border.all(
                                  color: Colors.blueAccent, width: 3),
                              shape: BoxShape.circle,
                              image: imageController.imagePath.value.isNotEmpty
                                  ? DecorationImage(
                                      image: FileImage(File(
                                          imageController.imagePath.value)),
                                      fit: BoxFit.cover,
                                    )
                                  : const DecorationImage(
                                      image: AssetImage("assets/images/p.png"),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: const Icon(Icons.camera_alt,
                                  color: Colors.white, size: 20),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                CustomTextIcon(text: "Phone"),
                Textfield1(
                  controller: controller.phoneController,
                  hintText: 'Enter your phone number',
                  inputype: TextInputType.phone,
                  suffixicon: Icons.phone,
                ),
                CustomTextIcon(text: "Email"),
                Textfield1(
                  controller: controller.emailController,
                  hintText: 'Enter your email',
                  inputype: TextInputType.emailAddress,
                  suffixicon: Icons.email,
                ),

                CustomTextIcon(text: "Name"),
                Textfield1(
                  controller: controller.nameController,
                  hintText: 'Enter your full name',
                  suffixicon: Icons.person,
                ),

                CustomTextIcon(text: "Monthly Income"),
                Textfield1(
                  controller: controller.monthly_incomeController,
                  hintText: 'Enter your monthly income',
                  inputype: TextInputType.number,
                  suffixicon: Icons.monetization_on,
                ),

                CustomTextIcon(text: "Permanent Address"),
                Textfield1(
                  controller: controller.permanent_addreessController,
                  hintText: 'Enter your permanent address',
                  suffixicon: Icons.location_on,
                ),

                CustomTextIcon(text: "Present Address"),
                Textfield1(
                  controller: controller.present_addressController,
                  hintText: 'Enter your present address',
                  suffixicon: Icons.location_on,
                ),
                const SizedBox(height: 100.0),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: CustomButton(
          text: 'SUBMIT',
          ontap: () {
            Fluttertoast.showToast(msg: 'Profile Updated');
          },
        ),
      ),
    );
  }
}
