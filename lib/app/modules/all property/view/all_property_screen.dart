import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/custom_textfield3.dart';
import '../../../../controller/property_list_controller.dart';
import '../../../../utils/app_color.dart';
import '../../../../widgets/custom_text.dart';
import '../contoller/search_controller.dart';
import 'all_property_details.dart';
class AllPropertyScreen extends StatelessWidget {
  AllPropertyScreen({super.key});
  final controller = Get.put(AllSearchController());

  final propertyController = Get.put(FincaPropertyController());

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          title: Text('All Properties'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Obx(() {
          if (propertyController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: SafeArea(
                child: Column(
                  children: [
                    // Search Location
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextfield3(
                            onchanged: (value) {
                              controller.runFilter(value);
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search,
                              color: AppColor.baseColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    // All properties list
                    Expanded(
                      child: Obx(
                        () => ListView.builder(
                          itemCount: propertyController.propertyList.length > 2
                              ? 2
                              : propertyController.propertyList.length,
                          itemBuilder: (context, index) {
                            final item = controller.foundItem[index];
                            final property =
                                propertyController.propertyList[index];

                            // Navigate to Details screen
                            return InkWell(
                              onTap: () {
                                Get.to(() =>
                                    AllPropertyDetails(property: property));
                              },
                              child: Container(
                                key: ValueKey(item["Id"]),
                                height: 140,
                                margin: const EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      spreadRadius: 1.0,
                                      blurRadius: 10.0,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    // Property image
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.horizontal(
                                              left: Radius.circular(10.0)),
                                          child: Image.network(
                                            property.featuredImage ?? ' ',
                                            width: w / 3,
                                            fit: BoxFit.cover,
                                            height: double.infinity,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          left: 0,
                                          child: Container(
                                            padding: EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomLeft:
                                                    Radius.circular(10.0),
                                              ),
                                            ),
                                            child: Text(
                                              property.price ?? ' ',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Property Info
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              text:
                                                  property.propertyName ?? ' ',
                                              color: Colors.teal,
                                              maxline: 2,
                                              fontsize: 16.0,
                                              fontweight: FontWeight.bold,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 2),
                                              decoration: BoxDecoration(
                                                  color: Colors.deepOrange),
                                              child: CustomText(
                                                text:
                                                    property.propertyTypeName ??
                                                        ' ',
                                                color: Colors.white,
                                                fontsize: 16.0,
                                              ),
                                            ),
                                            CustomText(
                                              text: property.cityName ?? ' ',
                                              color: Colors.black87,
                                              fontsize: 14.0,
                                            ),
                                            CustomText(
                                              text:
                                                  property.constructionStatus ??
                                                      ' ',
                                              color: Colors.black38,
                                              fontsize: 14.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }));
  }
}
