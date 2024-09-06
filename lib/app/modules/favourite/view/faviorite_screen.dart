import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/app_color.dart';
import '../../../../widgets/custom_text.dart';
import '../../all property/contoller/favorte_controller.dart';
import '../../all property/view/all_property_details.dart';
import '../../all property/view/all_property_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Favorites',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Iconsax.add_circle, color: Colors.blue, size: 28),
            onPressed: () {
              Get.to(() => AllPropertyScreen());
            },
          )
        ],
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left, color: Colors.black87, size: 24),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Obx(() {
        return controller.favoriteItems.isEmpty
            ? Center(
                child: Text(
                  'No favorites added yet.',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16.0),
                ),
              )
            : ListView.builder(
                itemCount: controller.favoriteItems.length,
                itemBuilder: (context, index) {
                  final item = controller.favoriteItems[index];
                  return GestureDetector(
                    onTap: () {
                    /*  Get.to(() => AllPropertyDetails(
                          data: controller.favoriteItems[index]));*/
                    },
                    child: Container(
                      height: 130,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2.0,
                            blurRadius: 10.0,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              item["img"],
                              width: w / 3.5,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    text: item["title"],
                                    color: Colors.black,
                                    maxline: 2,
                                    fontsize: 16.0,
                                    fontweight: FontWeight.bold,
                                  ),
                                  CustomText(
                                    text: item["property_name"],
                                    color: Colors.grey.shade700,
                                    fontsize: 14.0,
                                  ),
                                  CustomText(
                                    text: item["location"],
                                    color: Colors.grey.shade500,
                                    fontsize: 13.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CustomText(
                                        text: "more...",
                                        color: Colors.blue,
                                        fontsize: 14.0,
                                        fontweight: FontWeight.w600,
                                      ),
                                      InkWell(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Icon(
                                          Iconsax.heart5,
                                          color: Colors.redAccent,
                                          size: 24.0,
                                        ),
                                        onTap: () {
                                          controller.toggleFavorite(item);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
      }),
    );
  }
}
