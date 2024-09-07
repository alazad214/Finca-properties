import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:intl/intl.dart';

class Addpage2Controller extends GetxController {
  final SingleValueDropDownController florController =
      SingleValueDropDownController();
  final  titlecontroller = TextEditingController();
  final  descriptioncontroller = TextEditingController();
  final  mobilecontroller = TextEditingController();

  var selectedDate = ''.obs;
  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      selectedDate.value = DateFormat('MM/dd/yyyy').format(picked);
    }
  }
}
