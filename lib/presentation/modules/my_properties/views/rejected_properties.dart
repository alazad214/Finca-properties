import 'package:flutter/material.dart';

class RejectedProperties extends StatelessWidget {
  const RejectedProperties({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {'sl': 1, 'id': '001', 'name': 'John Doe', 'visitors': 25},
      {'sl': 2, 'id': '002', 'name': 'Jane Smith', 'visitors': 30},
      {'sl': 3, 'id': '003', 'name': 'Bob Johnson', 'visitors': 40},
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: DataTable(
              columnSpacing: 20.0,
              headingRowColor: WidgetStateColor.resolveWith(
                  (states) => Colors.deepPurple.shade50),
              columns: const [
                DataColumn(
                  label: Text(
                    'S.L. No',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'ID',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Visitors',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
              rows: data.map((item) {
                return DataRow(
                  cells: [
                    DataCell(Text(
                      item['sl'].toString(),
                      style: const TextStyle(fontSize: 14.0),
                    )),
                    DataCell(Text(
                      item['id'],
                      style: const TextStyle(fontSize: 14.0),
                    )),
                    DataCell(Text(
                      item['name'],
                      style: const TextStyle(fontSize: 14.0),
                    )),
                    DataCell(Text(
                      item['visitors'].toString(),
                      style: const TextStyle(fontSize: 14.0),
                    )),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
