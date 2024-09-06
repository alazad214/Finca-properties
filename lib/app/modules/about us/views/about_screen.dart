import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Screen"),
        titleSpacing: 0,
        backgroundColor: Colors.teal,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
