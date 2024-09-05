import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:universe_it_project/widgets/back_app_bar.dart';
import 'package:universe_it_project/widgets/dropdown.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_dropdown.dart';
import '../../../../widgets/custom_text.dart';
import '../controller/add_controller.dart';
import '../controller/addpage1_controller.dart';
import '../widgets/custom_text_icon.dart';
import '../widgets/textfield_custom.dart';

class Addscreen1 extends StatelessWidget {
  final PageController pageController;
  Addscreen1({super.key, required this.pageController});

  final controller = Get.put(Addpage1Controller());
  final addcontroller = Get.put(AddController());
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
                  text: 'Basic Information',
                  fontsize: 22.0,
                ),
                const CustomTextIcon(text: "Property type"),

                DropdownWidget(
                  dropDownList: const [
                    DropDownValueModel(
                        name: 'Apartment/Flats', value: "Apartment/Flats"),
                    DropDownValueModel(
                        name: 'Independent House', value: "Independent House"),
                    DropDownValueModel(
                        name: 'Duplex/Home', value: "Duplex/Home"),
                    DropDownValueModel(
                        name: 'Shop/Restaurant', value: "Shop/Restaurant"),
                    DropDownValueModel(
                        name: 'Office Space', value: "Office Space"),
                    DropDownValueModel(
                        name: 'Industrial Space', value: "Industrial Space"),
                    DropDownValueModel(
                        name: 'Residential Plot', value: "Residential Plot"),
                    DropDownValueModel(
                        name: 'Commercial Plot', value: "Commercial Plot"),
                    DropDownValueModel(
                        name: 'Agriculture/Firm', value: "Agriculture/Firm"),
                  ],
                  hintText: "Select an item",
                  enablesearch: false,
                  controller: controller.typeController,
                  onchanged: (value) {
                    addcontroller.type.value = value.value;
                    controller.updatePropertyType(value.value);
                  },
                ),

                const CustomTextIcon(text: "City"),
                DropdownWidget(
                  dropDownList: const [
                    DropDownValueModel(name: 'Dhaka', value: "Dhaka"),
                    DropDownValueModel(name: 'Thakurgaon', value: "Thakurgaon"),
                    DropDownValueModel(name: 'Chattagram', value: "Chattagram"),
                  ],
                  hintText: "Select an item",
                  enablesearch: false,
                  controller: controller.typeController,
                ),
                const CustomTextIcon(text: "Area"),
                DropdownWidget(
                  dropDownList: const [
                    DropDownValueModel(name: 'Dhaka', value: "Dhaka"),
                    DropDownValueModel(name: 'Thakurgaon', value: "Thakurgaon"),
                    DropDownValueModel(name: 'Chattagram', value: "Chattagram"),
                  ],
                  hintText: "Select an item",
                  enablesearch: false,
                  controller: controller.typeController,
                ),
                const CustomTextIcon(text: "Construction Status"),
                DropdownWidget(
                  dropDownList: const [
                    DropDownValueModel(name: 'Any', value: "Any"),
                    DropDownValueModel(name: 'Ready', value: "Ready"),
                    DropDownValueModel(
                        name: 'Under Construction',
                        value: "Under Construction"),
                    DropDownValueModel(name: 'Used', value: "Used"),
                    DropDownValueModel(name: 'Upcoming', value: "Upcoming"),
                    DropDownValueModel(
                        name: 'Almost Ready', value: "Almost Ready"),
                  ],
                  controller: controller.statusController,
                  hintText: "Select an item",
                  enablesearch: false,
                  onchanged: (value) {
                    addcontroller.status.value = value.value;
                  },
                ),
                const CustomTextIcon(text: "Address"),
                ReusableTextField(
                  hintText: 'Type Address',
                  maxLines: 2,
                  controller: controller.addressController,
                  onchanged: (value) {
                    addcontroller.addressName.value = value;
                  },
                ),

                const CustomTextIcon(text: "Property Name"),
                ReusableTextField(
                  hintText: 'Property name',
                  maxLines: 2,
                  controller: controller.propertyNameController,
                  onchanged: (value) {
                    addcontroller.propertyName.value = value;
                  },
                ),

                /// Property Size and pricing...
                const SizedBox(height: 15.0),
                CustomText(
                  text: 'Property Size & Pricing',
                  fontsize: 22.0,
                ),

                const CustomTextIcon(text: "Property Size in sftd"),
                ReusableTextField(
                  hintText: "Property size in sft",
                  keyboardtype: TextInputType.number,
                  controller: controller.sizesftController,
                  onchanged: (value) {
                    addcontroller.size.value = value;
                  },
                ),
                const CustomTextIcon(text: "Price per sft"),
                ReusableTextField(
                  hintText: "Price per sft",
                  keyboardtype: TextInputType.number,
                  controller: controller.sizesftController,
                  onchanged: (value) {
                    addcontroller.size.value = value;
                  },
                ),

                const CustomTextIcon(text: "Utility & Other Cost"),
                ReusableTextField(
                  hintText: 'If any other costs',
                  keyboardtype: TextInputType.number,
                  controller: controller.utilitytController,
                  onchanged: (value) {
                    addcontroller.utilityCost.value = value;
                  },
                ),
                const CustomTextIcon(text: "Total Price"),
                ReusableTextField(
                  hintText: 'Total price',
                  keyboardtype: TextInputType.number,
                  controller: controller.priceController,
                  onchanged: (value) {
                    addcontroller.totalPrice.value = value;
                  },
                ),
                const SizedBox(height: 15.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: RadioListTile<String>(
                          activeColor: Colors.amber,
                          contentPadding: EdgeInsets.zero,
                          title: Text('Fixed'),
                          value: 'Fixed',
                          groupValue: addcontroller.priceIs.value,
                          onChanged: (value) {
                            if (value != null) {
                              addcontroller.setSelectedOption(value);
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        flex: 2,
                        child: RadioListTile<String>(
                          activeColor: Colors.amber,
                          contentPadding: EdgeInsets.zero,
                          title: Text('Negotiatable'),
                          value: 'Negotiatable',
                          groupValue: addcontroller.priceIs.value,
                          onChanged: (value) {
                            if (value != null) {
                              addcontroller.setSelectedOption(value);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                /// Property Basic Features...
                const SizedBox(height: 15.0),
                CustomText(
                  text: 'Property Basic Features',
                  fontsize: 22.0,
                ),

                // BEDROOM
                if (controller.propertyvalue.value) ...[
                  const CustomText(text: "Property Basic Features"),
                  const SizedBox(height: 5.0),
                  const CustomTextIcon(text: "Bedroom"),
                  DropdownWidget(
                    dropDownList: const [
                      DropDownValueModel(name: '1', value: "1"),
                      DropDownValueModel(name: '2', value: "2"),
                      DropDownValueModel(name: '3', value: "3"),
                      DropDownValueModel(name: '4', value: "4"),
                      DropDownValueModel(name: '5', value: "5"),
                    ],
                    hintText: "Select an item",
                    enablesearch: false,
                    controller: controller.bedroomController,
                    onchanged: (value) {
                      addcontroller.Bedroom.value = value.value;
                    },
                  ),
                  const SizedBox(height: 15.0),

                  // BATHROOM
                  const CustomTextIcon(text: "Bathroom"),
                  DropdownWidget(
                    dropDownList: const [
                      DropDownValueModel(name: '1', value: "1"),
                      DropDownValueModel(name: '2', value: "2"),
                      DropDownValueModel(name: '3', value: "3"),
                      DropDownValueModel(name: '4', value: "4"),
                    ],
                    hintText: "Select an item",
                    enablesearch: false,
                    controller: controller.bathroomController,
                    onchanged: (value) {
                      addcontroller.Bathroom.value = value.value;
                    },
                  ),
                  const SizedBox(height: 15.0),

                  // BALCONIES
                  const CustomTextIcon(text: "Balconies"),
                  DropdownWidget(
                    dropDownList: const [
                      DropDownValueModel(name: '1', value: "1"),
                      DropDownValueModel(name: '2', value: "2"),
                      DropDownValueModel(name: '3', value: "3"),
                      DropDownValueModel(name: '4', value: "4"),
                    ],
                    hintText: "Select an item",
                    enablesearch: false,
                    controller: controller.belconisController,
                    onchanged: (value) {
                      addcontroller.Belconis.value = value.value;
                    },
                  ),
                  const SizedBox(height: 15.0),
                ],

                // GARAGES
                const CustomTextIcon(text: "Garages"),
                DropdownWidget(
                  dropDownList: const [
                    DropDownValueModel(name: 'No Parking', value: "No Parking"),
                    DropDownValueModel(name: '1', value: "1"),
                    DropDownValueModel(name: '2', value: "2"),
                    DropDownValueModel(name: '3', value: "3"),
                    DropDownValueModel(name: '4', value: "4"),
                  ],
                  hintText: "Select an item",
                  enablesearch: false,
                  controller: controller.garagesController,
                  onchanged: (value) {
                    addcontroller.garages.value = value.value;
                  },
                ),
                const SizedBox(height: 20),

                // NEXT BUTTON
                CustomButton(
                  text: "Continue",
                  ontap: () {
                    if (formkey.currentState!.validate()) {

                      Fluttertoast.showToast(
                        msg:
                            "${addcontroller.addressName.value} ${addcontroller.propertyName.value}",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                      );
                    }
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
    });
  }
}
