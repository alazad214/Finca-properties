import 'package:flutter/material.dart';
import 'package:universe_it_project/presentation/modules/my_properties/views/accepted_property.dart';
import 'package:universe_it_project/presentation/modules/my_properties/views/pending_properties.dart';
import 'package:universe_it_project/presentation/modules/my_properties/views/rejected_properties.dart';
import 'package:universe_it_project/utils/app_color.dart';

class PropertyListScreen extends StatelessWidget {
  PropertyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Properties',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: AppColor.baseColor,
          elevation: 4,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 4.0,
            labelStyle: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelColor: Colors.white24,
            tabs: const [
              Tab(
                text: 'Accepted',
                icon: Icon(Icons.check_circle_outline),
              ),
              Tab(
                text: 'Pending',
                icon: Icon(Icons.hourglass_empty),
              ),
              Tab(
                text: 'Rejected',
                icon: Icon(Icons.cancel_outlined),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AcceptedProperty(),
            PendingProperties(),
            RejectedProperties(),
          ],
        ),
      ),
    );
  }
}
