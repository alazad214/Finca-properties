import 'package:flutter/material.dart';
import 'package:universe_it_project/app/modules/add%20property/widgets/selectDate.dart';

class DateFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;
  final int? maxLines;
  final TextInputType keyboardType;
  final String hintText;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  DateFieldWidget({
    required this.controller,
    this.readOnly = false,
    this.maxLines,
    this.keyboardType = TextInputType.text,
    this.hintText = '',
    this.suffixIcon,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      maxLines: maxLines,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.black26, fontSize: 12.0),
        hintText: hintText,
        border: const OutlineInputBorder(),
        suffixIcon: suffixIcon,
      ),
      onTap: () async {
        await selectDate(context, controller); // Show date picker on tap
        if (onTap != null) {
          onTap!(); // Call additional onTap behavior if provided
        }
      },
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
