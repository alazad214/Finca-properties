import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import 'package:universe_it_project/widgets/custom_textfield.dart';

import '../controller/signup_controller.dart';

class CompanySignup extends StatelessWidget {
  CompanySignup({super.key});
  final controller = Get.put(SignupController());
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Textfield1(
          hinttext: "Company Name",
          suffixicon: Iconsax.house,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Company Name Required';
            }
            return null;
          },
        ),
        const SizedBox(height: 20.0),
        Textfield1(
          hinttext: "Client Name",
          suffixicon: Icons.person_outline_rounded,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Name Required';
            }
            return null;
          },
        ),
        const SizedBox(height: 20.0),
        Textfield1(
          hinttext: "Mobile",
          suffixicon: Iconsax.call,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Number Required';
            }
            if (value.length <= 11) {
              return 'Enter 11 digit';
            }
            return null;
          },
        ),
        const SizedBox(height: 20.0),
        //email
        Textfield1(
          hinttext: "Email",
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
        const SizedBox(height: 20.0),
        //password
        Textfield1(
          hinttext: "Destination",
          suffixicon: Icons.work_outline,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Destination';
            }

            return null;
          },
        ),
        const SizedBox(height: 20.0),
        Textfield1(
          hinttext: "Mobile 2",
          suffixicon: Iconsax.call,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Number Required';
            }
            if (value.length <= 11) {
              return 'Enter 11 digit';
            }
            return null;
          },
        ),
        const SizedBox(height: 20.0),
        Textfield1(
          hinttext: "Office Address",
          suffixicon: Iconsax.home_wifi,
          maxline: 3,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Office Address Required';
            }
            return null;
          },
        ),
        const SizedBox(height: 20.0),
        //password
        Textfield1(
          hinttext: "Password",
          suffixicon: Icons.remove_red_eye_outlined,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters long';
            }
            return null;
          },
        ),
        const SizedBox(height: 20.0),
        //confirm password
        const Textfield1(
          hinttext: "Confirm Password",
          suffixicon: Icons.remove_red_eye_outlined,
        ),
        const SizedBox(height: 20.0),

        CustomText(
          text: "All fields are required.",
          color: Colors.black,
          fontsize: 14.0,
        ),
        SizedBox(height: 30.0),
      ],
    );
  }
}
