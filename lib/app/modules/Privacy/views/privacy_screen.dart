import 'package:flutter/material.dart';
import 'package:universe_it_project/utils/app_color.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy Policy",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.baseColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            Center(
              child: Icon(
                Icons.privacy_tip,
                color: AppColor.baseColor,
                size: 80.0,
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Welcome to Finca Properties",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "We are committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application.",
                      style: TextStyle(
                        fontSize: 16.0,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "Personal Data",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "We may collect personally identifiable information such as your name, email address, and phone number.",
                      style: TextStyle(fontSize: 16.0, height: 1.5),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "Usage Data",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "We collect information about how you use our application, including device information (e.g., IP address, operating system) and application usage details (e.g., pages visited, features used).",
                      style: TextStyle(fontSize: 16.0, height: 1.5),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "Location Data",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "If you enable location services, we may collect information about your location.",
                      style: TextStyle(fontSize: 16.0, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
