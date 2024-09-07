import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool readOnly;
  final Icon? suffixIcon;
  final void Function()? onTap;
  final int maxLines;
  final TextInputType? keyboardtype;
  final Key? formkey;
  final String? Function(String?)? validation;
  final Function(String)? onchanged;

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
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextFormField(
        readOnly: readOnly,
        maxLines: maxLines,
        onChanged: onchanged,
        keyboardType: keyboardtype,
        decoration: InputDecoration(
          hintStyle:  TextStyle(color: Colors.black26, fontSize: 12.0),
          hintText: hintText,
          border:  OutlineInputBorder(),
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.teal), // Normal state border color
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.green), // Focused state border color
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.red), // Error state border color
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onTap: onTap,
        controller: controller,
        validator: validation ??
                (value) {
              if (value == null || value.isEmpty) {
                return 'Fields are required';
              }
              return null;
            },
      ),
    );
  }
}
