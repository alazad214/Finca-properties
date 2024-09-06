import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import '../app/modules/search/controller/search_dropdown_controller.dart';

class DropdownWidget extends StatelessWidget {
  final List<DropDownValueModel> dropDownList;
  final String hintText;
  final SearchDropdownController? searchcontroller;
  final controller;
  final enablesearch;
  final onchanged;
  final formkey;

  const DropdownWidget({
    super.key,
    required this.dropDownList,
    this.hintText = "Select an option",
    this.controller,
    this.enablesearch,
    this.onchanged,
    this.searchcontroller,
    this.formkey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(6.0)),
      child: DropDownTextField(
        clearOption: false,
        dropDownList: dropDownList,
        controller: controller,
        onChanged: onchanged,
        enableSearch: enablesearch ?? true,
        dropDownItemCount: dropDownList.length,
        searchTextStyle: const TextStyle(color: Colors.red),
        searchDecoration: InputDecoration(
          hintText: hintText,
        ),
        textFieldDecoration: const InputDecoration(
            hintText: "Tap to select", border: InputBorder.none),
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
