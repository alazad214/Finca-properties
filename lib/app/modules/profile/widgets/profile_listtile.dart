import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileListtile extends StatelessWidget {
  const ProfileListtile({
    super.key,
    this.title,
    this.subtitle,
    this.icon,
    this.arrowicon,
    this.ontap,
  });

  final String? title;
  final String? subtitle;
  final IconData? icon;
  final IconData? arrowicon;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Icon(
                    icon ?? Iconsax.mobile,
                    color: Colors.white,
                  )),
              SizedBox(width: 20.0),
              Text(
                title ?? "",
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Spacer(),
              Icon(
                arrowicon,
                color: Colors.green,
              )
            ],
          )),
    );
  }
}
