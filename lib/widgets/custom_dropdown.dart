import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import '../app/modules/search/controller/search_dropdown_controller.dart';

class DropdownWidget extends StatelessWidget {
  final List<DropDownValueModel> dropDownList;
  final String hintText;
  final SearchDropdownController? searchcontroller;
  final SingleValueDropDownController? controller;
  final bool? enablesearch;
  final Function(dynamic)? onchanged;
  final Key? formkey;
  final String? hinttext;

  const DropdownWidget({
    super.key,
    required this.dropDownList,
    this.hintText = "Select an option",
    this.controller,
    this.enablesearch,
    this.onchanged,
    this.searchcontroller,
    this.formkey,
    this.hinttext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropDownTextField(
        clearOption: false,
        dropDownList: dropDownList,
        controller: controller,
        onChanged: onchanged,
        enableSearch: enablesearch ?? true,
        dropDownItemCount: dropDownList.length,
        textFieldDecoration: InputDecoration(
          hintStyle: const TextStyle(
            color: Colors.grey, // Hint text color
            fontSize: 12.0,
          ),
          hintText: hinttext ?? "Tap to select",
          border: InputBorder.none, // No border inside the dropdown
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Fields are required';
          }
          return null;
        },
      ),
    );
  }
}
