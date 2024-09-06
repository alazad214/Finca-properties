import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/backFlotingActionButto.dart';
import '../../../../widgets/custom_button.dart';
import '../controller/addController3.dart';

class Addscreen3 extends StatelessWidget {
  final PageController pageController;
  Addscreen3({super.key, required this.pageController});

  ///Controller...
  final controller = Get.put(Addcontroller3());

  ///GlobalKey...
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.0),

                  // Featured Image
                  Text(
                    'Featured Image',
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: controller.pickFile,
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: Colors.black26),
                            child: Text("Choose File"),
                          ),
                          SizedBox(width: 16),
                          Flexible(
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              controller.fileName.value,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "This is going to be the main image of your property, which will be displayed in thumbnail and all other important places. (aspect ratio 1080X720)",
                    style: TextStyle(color: Colors.black26),
                  ),

                  // Gallery Images
                  Text(
                    'Upload your gallery images',
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Note: Image (aspect ratio 1080X720)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 16),

                  Obx(() {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.imageList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () => controller.pickImage(index),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () => controller.pickImage(index),
                                      child: Text('Choose File'),
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(horizontal: 20),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        controller.imageList[index].isNotEmpty
                                            ? controller.imageList[index]
                                            : 'No file chosen',
                                        style: TextStyle(color: Colors.grey),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    ElevatedButton(
                                      onPressed: () => controller.removeImageContainer(index),
                                      child: Text('Remove'),
                                      style: ElevatedButton.styleFrom(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        );
                      },
                    );
                  }),
                  ElevatedButton(
                    onPressed: controller.addImageContainer,
                    child: Text('Add Another Image'),
                    style: ElevatedButton.styleFrom(),
                  ),
                  SizedBox(height: 20.0),

                  // Post Now Button
                  CustomButton(
                    text: "Post Now",
                    ontap: () {
                      if (formkey.currentState!.validate()) {
                        // Add your submission logic here
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
      floatingActionButton: BackFloatingbutton(
        onPerssed: () {
          pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
