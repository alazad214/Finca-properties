import 'package:flutter/material.dart';

class DashboardContainer extends StatelessWidget {
  const DashboardContainer({
    super.key,
    required this.text,
    required this.number,
    required this.color,
    this.icon,
  });

  final String text;
  final String number;
  final Color color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: 100,
      width: screenSize.width - 30, // Adjusted width to fit within padding
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null)
            Container(
              margin: const EdgeInsets.only(left: 15.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          const SizedBox(width: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                number,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
