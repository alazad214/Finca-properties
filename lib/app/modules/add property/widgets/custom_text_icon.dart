
import 'package:flutter/material.dart';


class CustomTextIcon extends StatelessWidget {
  final text;

  const CustomTextIcon({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.0, top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.teal, fontSize: 16),
          ),
          const Icon(
            Icons.star_rate_rounded,
            size: 10.0,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
