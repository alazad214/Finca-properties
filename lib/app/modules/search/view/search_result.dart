import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_color.dart';
import '../../../../widgets/custom_text.dart';
import '../../populer citys/controller/populer_city_search_controller.dart';

class SearchResult extends StatelessWidget {
  SearchResult({super.key});
  final searchcontroller = Get.put(PopulerCitySearchController());
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, right: 10.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchcontroller.foundItem.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          key:
                              ValueKey(searchcontroller.foundItem[index]["Id"]),
                          height: 120,
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
                              Image.asset(
                                searchcontroller.foundItem[index]["img"],
                                width: w / 3.5,
                                fit: BoxFit.cover,
                                height: 120,
                              ),
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
                                        text: searchcontroller.foundItem[index]
                                            ["title"],
                                        color: Colors.black,
                                        maxline: 2,
                                        fontsize: 14.0,
                                      ),
                                      CustomText(
                                        text: searchcontroller.foundItem[index]
                                            ["property_name"],
                                        color: Colors.black38,
                                        fontsize: 12.0,
                                      ),
                                      CustomText(
                                        text: searchcontroller.foundItem[index]
                                            ["location"],
                                        color: Colors.black38,
                                        fontsize: 12.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: searchcontroller
                                                .foundItem[index]["for"],
                                            color: Colors.blue,
                                            fontsize: 14.0,
                                          ),
                                          const CustomText(
                                            text: "more..",
                                            color: Colors.blue,
                                            fontsize: 14.0,
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
