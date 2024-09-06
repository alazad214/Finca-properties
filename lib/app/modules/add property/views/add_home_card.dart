import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/custom_button.dart';

import '../../../../widgets/custom_text.dart';

class AddHomeCard extends StatelessWidget {
  const AddHomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
          ),
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 1.0, blurRadius: 8.0)
              ]),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/flat.png",
                    height: 80.0,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Expanded(
                    child: CustomText(
                      text: "Loking to sell or out your property?",
                      fontweight: FontWeight.bold,
                      maxline: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              CustomButton(
                text: "Add Property",
                ontap: () {
                  Get.toNamed('/add_property');
                },
              )
            ],
          )),
    );
  }
}
