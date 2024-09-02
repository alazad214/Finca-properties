import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/presentation/modules/add%20property/controller/add_controller.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import '../../../../widgets/backFlotingActionButto.dart';
import '../../../../widgets/custom_dropdown.dart';
import '../controller/addpage2_controller.dart';
import '../widgets/custom_text_icon.dart';

import '../widgets/textfield_custom.dart';

class Addscreen2 extends StatelessWidget {
  final PageController pageController;
  Addscreen2({super.key, required this.pageController});

  final controller = Get.put(Addpage2Controller());
  final dateController = TextEditingController();
  final addcontroller = Get.put(AddController());
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Property Basic Features...
                  const SizedBox(height: 15.0),
                  CustomText(
                    text: 'Property Basic Features',
                    fontsize: 22.0,
                  ),
                  const Divider(),
                  const CustomTextIcon(text: "Floor Availabel On"),

                  ReusableTextField(
                    hintText: 'Floor Availabel On',
                    controller: controller.titlecontroller,
                    keyboardtype: TextInputType.phone,
                    onchanged: (value) {
                      addcontroller.title.value = value;
                    },
                  ),
                  const CustomTextIcon(text: "Total Floor Number"),
                  ReusableTextField(
                    hintText: 'Total Floor Number',
                    controller: controller.titlecontroller,
                    keyboardtype: TextInputType.phone,
                    onchanged: (value) {
                      addcontroller.title.value = value;
                    },
                  ),
                  const CustomTextIcon(text: "Facing "),
                  DropdownWidget(
                    dropDownList: const [
                      DropDownValueModel(name: 'North', value: "North"),
                      DropDownValueModel(name: 'North', value: "North"),
                      DropDownValueModel(name: 'North', value: "North"),
                      DropDownValueModel(name: 'North', value: "North"),
                    ],
                    hintText: "Select an item",
                    enablesearch: false,
                  ),
                  const CustomTextIcon(text: "Furnished  "),
                  DropdownWidget(
                    dropDownList: const [
                      DropDownValueModel(name: 'Fernished', value: "Fernished"),
                      DropDownValueModel(
                          name: 'UnFernished', value: "Un-Fernished"),
                      DropDownValueModel(
                          name: 'Semi-Fernished', value: "Semi-Fernished"),
                    ],
                    hintText: "Select an item",
                    enablesearch: false,
                  ),
                  const CustomTextIcon(text: "Handover Date "),

                  const CustomTextIcon(text: "Title"),
                  ReusableTextField(
                    hintText:
                        '212 sqft, 1 Bed Almost Ready Apartment/Flats for Sale at Karatia',
                    maxLines: 2,
                    controller: controller.titlecontroller,
                    onchanged: (value) {
                      addcontroller.title.value = value;
                    },
                  ),

                  const SizedBox(height: 15.0),

                  // Description Text Field
                  const CustomTextIcon(text: "Description"),
                  ReusableTextField(
                    hintText: 'Enter Description',
                    maxLines: 4,
                    controller: controller.descriptioncontroller,
                    onchanged: (value) {
                      addcontroller.Description.value = value;
                    },
                  ),
                  const SizedBox(height: 15.0),

                  // Phone Number Text Field
                  const CustomTextIcon(text: "Phone Number"),
                  ReusableTextField(
                    hintText: '+8801*********',
                    keyboardtype: TextInputType.phone,
                    suffixIcon: const Icon(Icons.arrow_drop_down),
                    controller: controller.mobilecontroller,
                    onchanged: (value) {
                      addcontroller.mobile.value = value;
                    },
                  ),
                  const SizedBox(height: 20.0),

                  // Post Button
                  CustomButton(
                    text: "Continue",
                    ontap: () {
                      if (formkey.currentState!.validate()) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: BackFloatingbutton(
          onPerssed: () {
            pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ));
  }
}
