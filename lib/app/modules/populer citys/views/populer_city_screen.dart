import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/custom_textfield3.dart';
import '../../../../utils/app_color.dart';
import '../../../../widgets/custom_text.dart';

import '../../all property/contoller/search_controller.dart';

class PopulerCityScreen extends StatelessWidget {
  PopulerCityScreen({super.key});
  final controller = Get.put(AllSearchController());

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, right: 10.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Search Location
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                    Flexible(child: CustomTextfield3(
                      onchanged: (value) {
                        controller.runFilter(value);
                      },
                    )),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),

                //all properties
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.foundItem.length,
                    itemBuilder: (context, index) {
                      final item = controller.foundItem[index];

                      //Navigate the Details screen
                      return InkWell(
                        onTap: () {
                          /* Get.to(() => AllPropertyDetails(
                                data: controller.foundItem[index],
                              ));*/
                        },
                        child: Container(
                          key: ValueKey(controller.foundItem[index]["Id"]),
                          height: 130,
                          clipBehavior: Clip.antiAlias,
                          margin: const EdgeInsets.only(left: 10.0, top: 10.0),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(6.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1.0,
                                blurRadius: 8.0,
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Property image
                              Stack(
                                children: [
                                  Image.asset(
                                    controller.foundItem[index]["img"],
                                    width: w / 3,
                                    fit: BoxFit.cover,
                                    height: 140,
                                  ),
                                  Positioned(
                                      left: 0,
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
                                          "Duplex Housing",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )),
                                ],
                              ),

                              //Property Info
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomText(
                                        text:
                                            "16000 sqrt let at Gulsan -116000 sqrt let at Gulsan-1",
                                        color: Colors.teal,
                                        maxline: 2,
                                        fontsize: 14.0,
                                      ),
                                      CustomText(
                                        text: "Gulsan 45, Dhaka",
                                        color: Colors.black,
                                        fontsize: 14.0,
                                      ),
                                      CustomText(
                                        text: "Aug. 7, 2024",
                                        color: Colors.black38,
                                        fontsize: 14.0,
                                      ),
                                      SizedBox(height: 5.0),
                                      const CustomText(
                                        text: "Tk- 545454",
                                        color: Colors.blue,
                                        fontsize: 16.0,
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
