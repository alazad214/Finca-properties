import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:universe_it_project/presentation/modules/add%20property/controller/addpage2_controller.dart';

Future<void> selectDate(
    BuildContext context, TextEditingController controller) async {
  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );

  if (selectedDate != null) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formattedDate = formatter.format(selectedDate);
    controller.text = formattedDate; // Update text field with selected date

    Get.find<Addpage2Controller>().setSelectedDate(formattedDate);
  }
}
