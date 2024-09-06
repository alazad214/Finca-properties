import 'package:flutter/material.dart';
import 'package:universe_it_project/widgets/custom_text.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.teal.withOpacity(0.1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "About Company",
          ),
          Container(
            height: 5,
            width: 50,
            color: Colors.teal,
          ),
          Text(
            'Finca Properties',
            style: TextStyle(fontSize: 18.0),
          ),
          Text('Address: Ferdous Tower (2nd Floor) 13/A/1'),
          Text('Panthapath, Dhaka-1205'),
          Text('Phone:  (+880) 1515291810'),
          Text('Phone:  (+880) 1772861569'),
          Text('Phone:  (+880) 1772861569'),
          SizedBox(height: 20.0),
          Text(
            'Connect With Us',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
