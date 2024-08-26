import 'package:flutter/material.dart';


class Textfield1 extends StatelessWidget {
  const Textfield1(
      {super.key,
      this.hinttext,
      this.suffixicon,
      this.validation,
      this.obscuretext,
      this.onchanged,
      this.inputype, this.maxline});

  final hinttext;
  final IconData? suffixicon;
  final validation;
  final obscuretext;
  final onchanged;
  final inputype;
  final maxline;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.0,
      width: double.infinity,
      child: TextFormField(
        maxLines: maxline,
        onChanged: onchanged,
        validator: validation,
        obscureText: obscuretext ?? false,
        keyboardType: inputype ?? TextInputType.text,
        decoration: InputDecoration(
          label: hinttext,
          suffixIcon: suffixicon != null ? Icon(suffixicon) : null,
        ),
      ),
    );
  }
}
