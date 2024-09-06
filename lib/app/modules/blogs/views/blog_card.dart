import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/utils/blogUtils.dart';
import 'package:universe_it_project/widgets/custom_card.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import 'blog_item.dart';
import 'blogs_details.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: CustomCard(
            width: double.infinity,

            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        text: "Blogs",
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const BlogItem());
                        },
                        child: const CustomText(
                          text: "See all..",
                          color: Colors.teal,
                        ),
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
                      for (int i = 0; i < blogUtils.length; i++)
                        InkWell(
                          onTap: () {
                            Get.to(BlogsDetails(data: blogUtils[i]));
                          },
                          child: Container(
                            height: 130.0,
                            width: 220,
                            margin: const EdgeInsets.only(right: 10),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                image: DecorationImage(
                                    image: AssetImage(blogUtils[i]["img"]),
                                    fit: BoxFit.cover)),
                            child: Container(
                              color: Colors.black26,
                              padding:
                                  const EdgeInsets.only(left: 5.0, bottom: 5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: blogUtils[i]["title"],
                                    maxline: 2,
                                    color: Colors.white,
                                    fontsize: 14.0,
                                  ),
                                  CustomText(
                                    text: blogUtils[i]["time"],
                                    color: Colors.white,
                                    fontsize: 12.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                )
              ],
            )));
  }
}
