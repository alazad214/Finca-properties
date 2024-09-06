import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/app/modules/search/view/search_result.dart';
import 'package:universe_it_project/widgets/custom_button.dart';
import '../../../../widgets/custom_dropdown.dart';
import '../../add property/widgets/custom_text_icon.dart';
import '../../add property/widgets/textfield_custom.dart';
import '../controller/search_dropdown_controller.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final _controller = Get.put(SearchDropdownController());
  final TextEditingController locationcontroller = TextEditingController();
  final locationController = SingleValueDropDownController();
  final locationformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.teal,
        titleSpacing: 0,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Keyword
              const CustomTextIcon(text: "Search Keyword"),
              const ReusableTextField(
                hintText: 'Enter your search keyword',
                maxLines: 1,
              ),
              const SizedBox(height: 15.0),

              // Property Category
              const CustomTextIcon(text: "Property Category"),
              DropdownWidget(
                dropDownList: const [
                  DropDownValueModel(
                      name: 'Apartment/Flats', value: "Apartment/Flats"),
                  DropDownValueModel(
                      name: 'Independent House', value: "Independent House"),
                  DropDownValueModel(name: 'Duplex/Home', value: "Duplex/Home"),
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
                hintText: "Select a category",
                enablesearch: false,
                onchanged: (val) {
                  _controller.statusSelectedValue.value = val.value;
                },
              ),
              const SizedBox(height: 15.0),

              // Construction Status
              const CustomTextIcon(text: "Construction Status"),
              DropdownWidget(
                dropDownList: const [
                  DropDownValueModel(name: 'Any', value: "Any"),
                  DropDownValueModel(name: 'Ready', value: "Ready"),
                  DropDownValueModel(
                      name: 'Under Construction', value: "Under Construction"),
                  DropDownValueModel(name: 'Used', value: "Used"),
                  DropDownValueModel(name: 'Upcoming', value: "Upcoming"),
                  DropDownValueModel(
                      name: 'Almost Ready', value: "Almost Ready"),
                ],
                hintText: "Select a status",
                enablesearch: false,
                onchanged: (val) {
                  _controller.statusSelectedValue.value = val.value;
                },
              ),
              const SizedBox(height: 15.0),

              // Location
              const CustomTextIcon(text: "Location"),
              Form(
                key: locationformkey,
                child: DropdownWidget(
                  dropDownList: const [
                    DropDownValueModel(name: 'Dhaka', value: "Dhaka"),
                    DropDownValueModel(name: 'Chittagong', value: "Chittagong"),
                    DropDownValueModel(name: 'Sylhet', value: "Sylhet"),
                    DropDownValueModel(name: 'Rajshahi', value: "Rajshahi"),
                    DropDownValueModel(name: 'Khulna', value: "Khulna"),
                    DropDownValueModel(name: 'Barisal', value: "Barisal"),
                    DropDownValueModel(name: 'Rangpur', value: "Rangpur"),
                    DropDownValueModel(name: 'Mymensingh', value: "Mymensingh"),
                    DropDownValueModel(name: 'Jashore', value: "Jashore"),
                    DropDownValueModel(name: 'Tangail', value: "Tangail"),
                  ],
                  hintText: "Select a location",
                  onchanged: (location) {
                    _controller.locationSelectedValue.value = location.value;
                  },
                  controller: locationController,
                ),
              ),
              const SizedBox(height: 30.0),

              // Search Button
              CustomButton(
                text: "Search Now",
                ontap: () {
                  if (locationformkey.currentState!.validate()) {
                    Get.to(() => SearchResult());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
