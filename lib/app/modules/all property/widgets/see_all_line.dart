import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/custom_text.dart';
import '../view/all_property_screen.dart';

class SeeAllLine extends StatelessWidget {
  const SeeAllLine({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomText(
            text: "All Property",
          ),
          InkWell(
            onTap: () {
              Get.to(AllPropertyScreen());
            },
            child: const CustomText(
              text: "See all..",
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
