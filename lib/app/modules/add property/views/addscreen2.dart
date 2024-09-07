import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import 'package:universe_it_project/widgets/custom_text.dart';
import '../../../../widgets/backFlotingActionButto.dart';
import '../../../../widgets/custom_dropdown.dart';
import '../controller/add_controller.dart';
import '../controller/addpage2_controller.dart';

import '../controller/amenities_controller.dart';
import '../widgets/textfield_custom.dart';

class Addscreen2 extends StatelessWidget {
  final PageController pageController;
  Addscreen2({super.key, required this.pageController});

  final controller = Get.put(Addpage2Controller());
  final dateController = TextEditingController();
  final addcontroller = Get.put(AddController());
  final amenitiesController = Get.put(AmenitiesController());
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
                CustomText(
                  text: 'Property Basic Features',
                  fontsize: 22.0,
                ),
                ReusableTextField(
                  hintText: 'Floor Availabel On',
                  controller: controller.titlecontroller,
                  keyboardtype: TextInputType.phone,
                  onchanged: (value) {
                    addcontroller.title.value = value;
                  },
                ),
                ReusableTextField(
                  hintText: 'Total Floor Number',
                  controller: controller.titlecontroller,
                  keyboardtype: TextInputType.phone,
                  onchanged: (value) {
                    addcontroller.title.value = value;
                  },
                ),

                DropdownWidget(
                  dropDownList: const [
                    DropDownValueModel(name: 'North', value: "North"),
                    DropDownValueModel(name: 'North', value: "North"),
                    DropDownValueModel(name: 'North', value: "North"),
                    DropDownValueModel(name: 'North', value: "North"),
                  ],
                  hinttext: "Facing",
                  enablesearch: false,
                ),

                DropdownWidget(
                  dropDownList: const [
                    DropDownValueModel(name: 'Fernished', value: "Fernished"),
                    DropDownValueModel(
                        name: 'UnFernished', value: "Un-Fernished"),
                    DropDownValueModel(
                        name: 'Semi-Fernished', value: "Semi-Fernished"),
                  ],
                  hinttext: "Furnished",
                  enablesearch: false,
                ),

                SizedBox(height: 15.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Handover Date',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () =>
                          controller.pickDate(context), // Opens DatePicker
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  controller: TextEditingController(
                    text: controller.selectedDate
                        .value, // Updates the field with selected date
                  ),
                  readOnly: true, // Makes it non-editable
                  onTap: () =>
                      controller.pickDate(context), // Opens DatePicker on tap
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Amenities",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Checkbox(
                              value: amenitiesController.selectAll.value,
                              onChanged: (value) {
                                amenitiesController
                                    .toggleSelectAll(value ?? false);
                              },
                            ),
                            const Text("Select All"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      children: [
                        for (int i = 0;
                            i < amenitiesController.amenities.length;
                            i++)
                          CheckboxListTile(
                            value: amenitiesController.amenities.values
                                .elementAt(i),
                            title: Text(amenitiesController.amenities.keys
                                .elementAt(i)),
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (value) {
                              amenitiesController.toggleAmenity(
                                amenitiesController.amenities.keys.elementAt(i),
                                value ?? false,
                              );
                            },
                          ),
                      ],
                    ),
                  ],
                ),

                ReusableTextField(
                  hintText: 'Type title',
                  maxLines: 2,
                  controller: controller.titlecontroller,
                  onchanged: (value) {
                    addcontroller.title.value = value;
                  },
                ),

                ReusableTextField(
                  hintText: 'Enter Description',
                  maxLines: 5,
                  controller: controller.descriptioncontroller,
                  onchanged: (value) {
                    addcontroller.Description.value = value;
                  },
                ),

                SizedBox(height: 20.0),

                // Post Button
                CustomButton(
                  text: "Continue",
                  ontap: () {
                    if (formkey.currentState!.validate()) {}
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
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
