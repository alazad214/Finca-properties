import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/custom_card.dart';
import '../../../../controller/property_list_controller.dart';
import '../../../../widgets/custom_text.dart';
import '../utils/property_data.dart';
import '../widgets/see_all_line.dart';
import 'all_property_details.dart';

class AllPropertyHomepageCard extends StatelessWidget {
  AllPropertyHomepageCard({super.key});

  final propertyController = Get.put(FincaPropertyController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (propertyController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        return CustomCard(
          child: Column(
            children: [
              ///All Property See all...
              SeeAllLine(),
              const SizedBox(height: 15.0),

              ///Property Card...
              SizedBox(
                height: 230,
                child: ListView.builder(
                  itemCount: propertyController.propertyList.length > 2
                      ? 2
                      : propertyController.propertyList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final item = propertyData[index];
                    final property = propertyController.propertyList[index];

                    return InkWell(
                      onTap: () {
                        Get.to(() => AllPropertyDetails(property: property));
                      },
                      child: Container(
                        width: 210.0,
                        margin: const EdgeInsets.only(right: 30.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                ///Images...
                                Container(
                                  height: 100.0,
                                  width: 220.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          property.featuredImage ?? ' '),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                ///Property Type ...
                                Positioned(
                                    left: -5,
                                    bottom: 10,
                                    child: Container(
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomLeft:
                                                  Radius.circular(10.0))),
                                      child: Text(
                                        property.price ?? ' ',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5.0),

                                  ///Title...
                                  CustomText(
                                    text: property.propertyName ?? ' ',
                                    color: Colors.teal,
                                    maxline: 2,
                                    fontsize: 14.0,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 2),
                                    decoration:
                                        BoxDecoration(color: Colors.deepOrange),
                                    child: CustomText(
                                      text: property.propertyTypeName ?? ' ',
                                      color: Colors.white,
                                      fontsize: 16.0,
                                    ),
                                  ),

                                  ///Location...
                                  CustomText(
                                    text: property.cityName ?? ' ',
                                    color: Colors.black,
                                    fontsize: 14.0,
                                  ),

                                  ///Status
                                  CustomText(
                                    text: property.constructionStatus ?? ' ',
                                    color: Colors.black54,
                                    fontsize: 13.0,
                                  ),
                                  SizedBox(height: 5.0),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
