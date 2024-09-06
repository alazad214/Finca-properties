import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/app/modules/populer%20citys/views/populer_city_screen.dart';
import 'package:universe_it_project/widgets/custom_card.dart';
import 'package:universe_it_project/widgets/custom_text.dart';

class PopulerCity extends StatelessWidget {
  const PopulerCity({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Populer City",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for(int i=0; i<5; i++)
                  InkWell(
                    onTap: (){
                      Get.to(()=> PopulerCityScreen());
                    },
                    child: Container(
                      height: 180.0,
                      width: 130,
                      margin: const EdgeInsets.only(right: 10),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/flat.jpg"),
                              fit: BoxFit.cover)),
                      child: Container(
                        color: Colors.black26,
                        padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Dhaka",
                              maxline: 2,
                              color: Colors.white,
                              fontsize: 14.0,
                            ),
                            CustomText(
                              text: "May 16, 2024",
                              color: Colors.white,
                              fontsize: 12.0,
                            )
                          ],
                        ),
                      ),
                    ),

                  ),
                ],
              ),
            )
          ],
        ));
  }
}
