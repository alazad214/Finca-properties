import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/custom_card.dart';
import '../../../../widgets/custom_text.dart';
import '../../all property/utils/property_data.dart';
import 'faviorite_screen.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(FavoriteScreen());
      },
      child: CustomCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 7.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: "Favourite",
                    fontsize: 18.0,
                    fontweight: FontWeight.bold,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(FavoriteScreen());
                    },
                    child: const CustomText(
                      text: "See all",
                      color: Colors.teal,
                      fontsize: 14.0,
                      fontweight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: propertyData.length > 2 ? 2 : propertyData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    width: 220.0,
                    margin: const EdgeInsets.only(right: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            image: DecorationImage(
                              image: AssetImage(propertyData[index]["img"]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: propertyData[index]["title"],
                                color: Colors.black,
                                maxline: 2,
                                fontsize: 16.0,
                                fontweight: FontWeight.bold,
                              ),
                              const SizedBox(height: 5.0),
                              CustomText(
                                text: propertyData[index]["property_name"],
                                color: Colors.black54,
                                fontsize: 14.0,
                              ),
                              CustomText(
                                text: propertyData[index]["location"],
                                color: Colors.black38,
                                fontsize: 12.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}