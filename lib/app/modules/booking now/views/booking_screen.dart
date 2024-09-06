import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/back_app_bar.dart';

import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textfield.dart';
import '../controller/booking_controller.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});
  final controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Backappbar(title: "Booking Now"),
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Booking Now',
                style: TextStyle(color: Colors.black, fontSize: 22.0),
              ),
              Text(
                'You can provide information what type properties are your choice',
                style: TextStyle(color: Colors.blue, fontSize: 15.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15.0),
              Textfield1(
                hintText: "Your Name",
                controller: controller.nameController,
                onchanged: (value) {
                  controller.name.value = value;
                },
              ),
              Textfield1(
                hintText: "Your Email",
                controller: controller.nameController,
                onchanged: (value) {
                  controller.email.value = value;
                },
              ),
              Textfield1(
                hintText: "Your Phone",
                controller: controller.nameController,
                onchanged: (value) {
                  controller.phone.value = value;
                },
              ),
              Textfield1(
                hintText: "Property Name",
                readonly: true,
                controller: controller.nameController,
                onchanged: (value) {
                  controller.subject.value = value;
                },
              ),
              Textfield1(
                hintText: "Write A Short Description",
                controller: controller.nameController,
                maxline: 4,
                onchanged: (value) {
                  controller.message.value = value;
                },
              ),
              SizedBox(height: 30.0),
              CustomButton(
                text: "Send Message",
                ontap: () {
                  Fluttertoast.showToast(msg: controller.name.value);
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
