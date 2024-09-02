
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';



class BackFloatingbutton extends StatelessWidget {
  final onPerssed;
  const BackFloatingbutton({super.key, this.onPerssed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPerssed,
      child: Icon(
        Iconsax.back_square,
        color: Colors.white,
      ),
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10.0,
    );
  }
}