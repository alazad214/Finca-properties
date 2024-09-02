import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class Addpage2Controller extends GetxController {
  final SingleValueDropDownController florController =
      SingleValueDropDownController();
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  final TextEditingController mobilecontroller = TextEditingController();

  final RxString selectedDate = ''.obs;

  // Method to update the selected date
  void setSelectedDate(String date) {
    selectedDate.value = date;
  }

  
}
