import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PropertySemmary extends StatelessWidget {
  const PropertySemmary({super.key, this.text, this.icon});
  final text;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon??Icons.circle, size: 12,color: Colors.teal,),
        SizedBox(width: 5.0),
        Text(
          text ?? ' ',
          style: TextStyle(fontSize: 16.0),
        )
      ],
    );
  }
}
