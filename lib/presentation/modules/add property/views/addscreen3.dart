import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/add%20property/controller/add_controller.dart';
import '../../../../widgets/backFlotingActionButto.dart';
import '../../../../widgets/custom_button.dart';
import '../controller/addController3.dart';

class Addscreen3 extends StatelessWidget {
  final PageController pageController;
  Addscreen3({super.key, required this.pageController});

  ///Controller...
  final controller = Get.put(Addcontroller3());
  final addcontroller = Get.put(AddController());

  ///GlobalKey...
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
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
                    padding: EdgeInsets.symmetric(horizontal: 10, ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: controller.pickFile,
                          child: Text('Choose File'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ),
                        SizedBox(width: 16),
                        Flexible(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            controller.fileName.value,
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                CustomButton(
                  text: "Post Now",
                  ontap: () {
                    if (formkey.currentState!.validate()) {}
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }), floatingActionButton: BackFloatingbutton(
      onPerssed: () {
        pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    ));
  }
}
