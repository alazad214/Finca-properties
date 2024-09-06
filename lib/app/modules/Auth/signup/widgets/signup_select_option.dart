import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/signup_controller.dart';

class SignupSelectOption extends StatelessWidget {
  SignupSelectOption({super.key});
  final controller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: RadioListTile(
              activeColor: Colors.amber,
              contentPadding: EdgeInsets.zero,
              title: Text('User'),
              value: 'User',
              groupValue: controller.selectedOption.value,
              onChanged: (value) {
                controller.setSelectedOption(value!);
              },
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            flex: 2,
            child: RadioListTile(
              activeColor: Colors.amber,
              contentPadding: EdgeInsets.zero,
              title: Text('Company'),
              value: 'Company',
              groupValue: controller.selectedOption.value,
              onChanged: (value) {
                controller.setSelectedOption(value!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
