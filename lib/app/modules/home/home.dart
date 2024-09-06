import 'package:flutter/material.dart';

import 'package:universe_it_project/widgets/custom_drawer.dart';

import '../add property/views/add_home_card.dart';
import '../all property/view/all_property_homePage_card.dart';
import '../blogs/views/blog_card.dart';
import '../client review/views/review_card.dart';
import '../favourite/view/favourite_card.dart';
import '../header/views/header_view.dart';
import '../populer citys/views/populer_city_card.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Container(
              color: Colors.white,
              child: HeaderView(
                onpressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
            ),
            // Body Section
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2.0,
                        blurRadius: 8.0,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        AddHomeCard(),
                        AllPropertyHomepageCard(),
                        FavouriteCard(),
                        BlogCard(),
                        PopulerCity(),
                        ReviewCard(),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer:  CustomDrawer(),
    );
  }
}
