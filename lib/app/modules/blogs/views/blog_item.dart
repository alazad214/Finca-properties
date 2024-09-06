import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/blogUtils.dart';
import 'blogs_details.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Blogs"),
        centerTitle: true,
        backgroundColor: AppColor.baseColor,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: blogUtils.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              Get.to(() => BlogsDetails(data: blogUtils[i]));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.asset(
                      blogUtils[i]["img"],
                      width: w / 3.5,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: blogUtils[i]["title"],
                            fontsize: 16.0,
                            color: Colors.black,
                            fontweight: FontWeight.bold,
                            maxline: 2,
                          ),
                          const SizedBox(height: 5),
                          CustomText(
                            text: blogUtils[i]["dis"],
                            fontsize: 14.0,
                            color: Colors.black87,
                            maxline: 3,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                size: 14,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 5),
                              CustomText(
                                text: "August 7, 2024",
                                fontsize: 12.0,
                                color: Colors.grey,
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
    );
  }
}
