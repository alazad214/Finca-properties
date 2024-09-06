import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({super.key, this.text, this.ontap});
  final text;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(width: 0.1)),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Text(
          text??' ',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    );
  }
}
