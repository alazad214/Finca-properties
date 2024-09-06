import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool readOnly;
  final Icon? suffixIcon;
  final void Function()? onTap;
  final int maxLines;
  final keyboardtype;
  final formkey;
  final validation;
  final onchanged;

  const ReusableTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.readOnly = false,
    this.suffixIcon,
    this.onTap,
    this.maxLines = 1,
    this.keyboardtype,
    this.formkey,
    this.validation,
    this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      maxLines: maxLines,
      onChanged: onchanged,
      keyboardType: keyboardtype,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.black26, fontSize: 12.0),
        hintText: hintText,
        border: const OutlineInputBorder(),
        suffixIcon: suffixIcon,
      ),
      onTap: onTap,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Fields are required';
        }
        return null;
      },
    );
  }
}
