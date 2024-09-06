import 'package:flutter/material.dart';
import 'package:universe_it_project/widgets/back_app_bar.dart';

import '../widgets/dashboard_container.dart';

class DeshboardScreen extends StatelessWidget {
  const DeshboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Backappbar(
        title: 'Dashboard',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      DashboardContainer(
                        text: 'Total Property',
                        number: '452',
                        color: Colors.blueAccent,
                        icon: Icons.home,
                      ),
                      const SizedBox(height: 15.0),
                      DashboardContainer(
                        text: 'Accepted Property',
                        number: '75',
                        color: Colors.amber,
                        icon: Icons.check_circle_outline,
                      ),
                      const SizedBox(height: 15.0),
                      DashboardContainer(
                        text: 'Pending Property',
                        number: '2',
                        color: Colors.greenAccent,
                        icon: Icons.pending_actions,
                      ),
                      const SizedBox(height: 15.0),
                      DashboardContainer(
                        text: 'Total Visitors',
                        number: '745',
                        color: Colors.blueGrey,
                        icon: Icons.group,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
