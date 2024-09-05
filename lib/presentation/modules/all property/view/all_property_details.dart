import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/all%20property/contoller/all_property_controller.dart';
import 'package:universe_it_project/presentation/modules/all%20property/widgets/contact_button.dart';
import 'package:universe_it_project/presentation/modules/all%20property/widgets/property_semmary.dart';
import 'package:universe_it_project/presentation/modules/booking%20now/views/booking_screen.dart';
import 'package:universe_it_project/presentation/modules/footer%20section/footer_section.dart';
import 'package:universe_it_project/utils/app_color.dart';
import 'package:universe_it_project/widgets/back_app_bar.dart';
import 'package:universe_it_project/widgets/custom_text.dart';

import '../../../../model/property_model.dart';

class AllPropertyDetails extends StatelessWidget {
  final FincaPropertyModel property;
  final controller = Get.put(AllPropertyController());
  final PageController _pageController = PageController();

  AllPropertyDetails({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Backappbar(title: 'Apartment/Flat Sell', bgcolor: Colors.teal),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Properties Images...
            _buildImageSlider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Properties Title And Location...
                  _buildPropertyTitleAndLocation(),
                  SizedBox(height: 15.0),

                  ///Properies IndoRow...
                  _buildPropertyInfoRow(),
                  Divider(color: Colors.black12, height: 20),

                  //Properties Summary
                  CustomText(text: "PROPERTY SUMMARY"),
                  Container(
                    height: 5,
                    width: 50,
                    color: Colors.teal,
                  ),
                  PropertySemmary(text: "City: ${property.cityName ?? ''}"),
                  PropertySemmary(
                      text:
                          "Property Type: ${property.propertyTypeName ?? ''}"),
                  PropertySemmary(
                      text:
                          "Property Type: ${property.propertyTypeName ?? ''}"),
                  PropertySemmary(text: "Facing: ${property.facing ?? ''}"),
                  PropertySemmary(text: "Facing: ${property.facing ?? ''}"),
                  PropertySemmary(text: "Bedroom: ${property.bedroom ?? ''}"),
                  PropertySemmary(
                      text: "Bathrooms: ${property.bathroom ?? ''}"),
                  PropertySemmary(
                      text: "Balconies: ${property.balconies ?? ''}"),
                  PropertySemmary(
                      text: "Size In Katha: ${property.sizeKatha ?? ''}"),
                  PropertySemmary(
                      text: "Apartment Size: ${property.size ?? ''}"),
                  PropertySemmary(
                      text: "Status: ${property.constructionStatus ?? ''}"),
                  PropertySemmary(text: "Garages: ${property.garages ?? ''}"),

                  const SizedBox(height: 30.0),

                  //Contact Button...
                  _buildContactButtons(),
                  const SizedBox(height: 20.0),
                  const CustomText(text: "PROPERTY DESCRIPTION"),

                  Container(
                    height: 5,
                    width: 50,
                    color: Colors.teal,
                  ),
                  Text(property.description ?? '')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSlider() {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          child: Obx(() {
            return PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: controller.imageList.length,
              itemBuilder: (context, index) {
                return Image.network(
                  property.featuredImage ?? '',
                  fit: BoxFit.cover,
                );
              },
            );
          }),
        ),
        Positioned(
          right: 16,
          top: 80,
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios,
                size: 30, color: Colors.white),
            onPressed: () {
              if (_pageController.page!.toInt() <
                  controller.imageList.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ),
        Positioned(
          left: 16,
          top: 80,
          child: IconButton(
            icon:
                const Icon(Icons.arrow_back_ios, size: 30, color: Colors.white),
            onPressed: () {
              if (_pageController.page!.toInt() > 0) {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPropertyTitleAndLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: property.propertyName ?? '',
          fontsize: 20.0,
          maxline: 3,
          color: Colors.teal,
        ),
        const SizedBox(height: 5.0),
        CustomText(
          text: property.cityName ?? '',
          fontsize: 16.0,
          color: AppColor.black_,
        ),
      ],
    );
  }

  Widget _buildPropertyInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildPropertyInfoContainer(
          text: property.propertyTypeName ?? '',
          color: Colors.blueAccent,
        ),
        _buildPropertyInfoContainer(
          text: "৳ ${property.price ?? ''}",
          color: Colors.green,
        ),
      ],
    );
  }

  Widget _buildPropertyInfoContainer(
      {required String text, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10.0),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  List<Widget> _buildPropertySummaryItems() {
    List<String> summaryItems = [
      'Size: 1231.00 sft',
      'Total Apartment: 2',
      'Facing: North',
      '5 Beds',
      '5 Balconies',
      'Size: 121.00 Katha',
      'Apartment Size: 1231.00 Ft',
      'Status: Ready',
      '5 Bathrooms',
      '1 Garage',
    ];

    return summaryItems
        .map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: PropertySemmary(text: item),
            ))
        .toList();
  }

  Widget _buildContactButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ContactButton(
          text: "Call Now",
          ontap: () {
            controller.makePhoneCall('01763551316');
          },
        ),
        ContactButton(
          text: "Booking Now",
          ontap: () {
            Get.to(() => BookingScreen());
          },
        ),
      ],
    );
  }
}
