import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/backFlotingActionButto.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import '../controller/addController3.dart';
import '../widgets/textfield_custom.dart';

class Addscreen3 extends StatelessWidget {
  final PageController pageController;
  Addscreen3({super.key, required this.pageController});

  final controller = Get.put(Addcontroller3());
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(() {
        return SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.0),
                  CustomText(
                    text: 'Property Basic Features',
                    fontsize: 22.0,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Featured Image',
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Main property image, shown in thumbnail and key spots. (1080x720)",
                    style: TextStyle(color: Colors.black26),
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
                              controller.fileName.value.isNotEmpty
                                  ? controller.fileName.value
                                  : 'No file selected',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
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
                  GestureDetector(
                    onTap: controller.pickFiles,
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
                            child: Text("Choose Files"),
                          ),
                          SizedBox(width: 16),
                          Obx(() {
                            final files = controller.selectedFiles;
                            return Flexible(
                              child: Text(
                                files.isNotEmpty
                                    ? '${files.length} files selected'
                                    : 'No files selected',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  Obx(() {
                    return GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemCount: controller.selectedFiles.length,
                      itemBuilder: (context, index) {
                        final file = controller.selectedFiles[index];
                        return Stack(
                          children: [
                            Container(
                              height: 100,
                              width: screenSize.width / 4,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Image.file(
                                File(file.path!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 4,
                              right: 4,
                              child: GestureDetector(
                                onTap: () {
                                  controller.removeFile(file);
                                },
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }),
                  ReusableTextField(
                    hintText: 'Note: YouTube video embed code',
                    keyboardtype: TextInputType.phone,
                    onchanged: (value) {},
                  ),
                  ReusableTextField(
                    hintText: 'Note: Google map embed url',
                    keyboardtype: TextInputType.phone,
                    onchanged: (value) {},
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'If all of the required fields data are filled than click Submit.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
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
