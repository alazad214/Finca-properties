import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/back_app_bar.dart';
import '../../../../controller/booking_property_controller.dart';
import '../../../../model/booking_item_model.dart';
import '../../../../widgets/custom_button.dart';
import '../controller/booking_controller.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});
  final controller = Get.put(BookingController());
  final bookingController = Get.put(BookingPropertyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Backappbar(title: "Booking Now"),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(rect);
                  },
                  child: Text(
                    'Booking Now',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Provide information about your desired properties.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),

                // Name Input
                buildTextField(
                  hintText: "Your Name",
                  controller: controller.nameController,
                  onChanged: (value) => controller.name.value = value,
                ),
                SizedBox(height: 15),

                // Email Input
                buildTextField(
                  hintText: "Your Email",
                  controller: controller.emailController,
                  onChanged: (value) => controller.email.value = value,
                ),
                SizedBox(height: 15),

                // Phone Input
                buildTextField(
                  hintText: "Your Phone",
                  controller: controller.phoneController,
                  onChanged: (value) => controller.phone.value = value,
                ),
                SizedBox(height: 20),

                // Property Dropdown
                Obx(() {
                  if (bookingController.isLoading.value) {
                    return CircularProgressIndicator(
                      color: Colors.purple,
                    );
                  }

                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<BookingItemModel>(
                        hint: Text(
                          'Choose a property',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 16),
                        ),
                        isExpanded: true,
                        value: bookingController.selectedProperty.value,
                        onChanged: (BookingItemModel? newValue) {
                          bookingController.selectedProperty.value = newValue;
                          print(bookingController.selectedProperty.value);
                        },
                        items: [
                          for (int i = 0;
                              i < bookingController.properties.length;
                              i++)
                            DropdownMenuItem<BookingItemModel>(
                              value: bookingController.properties[i],
                              child: Text(
                                bookingController.properties[i].title,
                                style: TextStyle(color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                        ],
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  );
                }),
                SizedBox(height: 20),

                // Description Input
                buildTextField(
                  hintText: "Write A Short Description",
                  controller: controller.messageController,
                  maxLines: 4,
                  onChanged: (value) => controller.message.value = value,
                ),
                SizedBox(height: 30),

                // Send Button with Gradient Background
                CustomButton(
                  text: "Send Message",
                  ontap: () {
                    Fluttertoast.showToast(msg: controller.name.value);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required String hintText,
    required TextEditingController controller,
    required Function(String) onChanged,
    int maxLines = 1,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 0.5, color: Colors.blue),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black54),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
