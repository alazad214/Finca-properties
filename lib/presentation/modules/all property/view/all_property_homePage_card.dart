import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:universe_it_project/presentation/modules/all%20property/contoller/favorte_controller.dart';
import 'package:universe_it_project/presentation/modules/all%20property/utils/property_data.dart';
import 'package:universe_it_project/presentation/modules/all%20property/view/all_property_details.dart';
import 'package:universe_it_project/presentation/modules/all%20property/widgets/see_all_line.dart';
import 'package:universe_it_project/widgets/custom_card.dart';
import '../../../../widgets/custom_text.dart';

class AllPropertyHomepageCard extends StatelessWidget {
  AllPropertyHomepageCard({super.key});
  final favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
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
              itemCount: propertyData.length > 2 ? 2 : propertyData.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final item = propertyData[index];
                // ignore: unused_local_variable
                final isFavorite = favoriteController.favoriteItems
                    .any((fav) => fav['Id'] == item['Id']);
                return InkWell(
                  onTap: () {
                    Get.to(() => AllPropertyDetails(
                          data: propertyData[index],
                        ));
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
                                  image: AssetImage(propertyData[index]["img"]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            ///Favorite Icon...
                            Positioned(
                              right: 0,
                              child: Obx(() {
                                bool isFavorite =
                                    favoriteController.isFavorite(item['id']);
                                return IconButton(
                                  onPressed: () {
                                    favoriteController.toggleFavorite(item);
                                  },
                                  icon: Icon(
                                    isFavorite ? Iconsax.heart5 : Iconsax.heart,
                                    color: Colors.red,
                                    size: 30.0,
                                  ),
                                );
                              }),
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
                                          bottomLeft: Radius.circular(10.0))),
                                  child: Text(
                                    "৳ ${"10000"}",
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
                                text: propertyData[index]["title"],
                                color: Colors.teal,
                                maxline: 2,
                                fontsize: 14.0,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                decoration:
                                    BoxDecoration(color: Colors.deepOrange),
                                child: const CustomText(
                                  text: "Duplex Housing",
                                  color: Colors.white,
                                  fontsize: 16.0,
                                ),
                              ),

                              ///Location...
                              CustomText(
                                text: "Gulsan 45, Dhaka",
                                color: Colors.black,
                                fontsize: 14.0,
                              ),

                              ///Date
                              CustomText(
                                text: "Aug. 7, 2024",
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
}
