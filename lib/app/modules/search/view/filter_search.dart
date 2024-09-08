import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universe_it_project/widgets/backFlotingActionButto.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String? selectedPropertyType;
  String? selectedCity;
  String? selectedDistrict;
  String? selectedSubDistrict;
  bool isCustomer = true;
  bool isSeller = false;

  final TextEditingController keywordController = TextEditingController();
  final TextEditingController minSizeController = TextEditingController();
  final TextEditingController maxSizeController = TextEditingController();
  final TextEditingController minBedController = TextEditingController();
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  void _clearFilters() {
    setState(() {
      // Text fields clear
      keywordController.clear();
      minSizeController.clear();
      maxSizeController.clear();
      minBedController.clear();
      minPriceController.clear();
      maxPriceController.clear();

      // Dropdowns reset
      selectedPropertyType = null;
      selectedCity = null;
      selectedDistrict = null;
      selectedSubDistrict = null;

      // Checkboxes reset
      isCustomer = true;
      isSeller = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Properties Filter"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0, bottom: 40.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: keywordController,
                decoration: InputDecoration(
                  labelText: 'Search Keyword',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Properties Type',
                  border: OutlineInputBorder(),
                ),
                value: selectedPropertyType,
                items: [
                  'Agriculture Plot',
                  'Residential Plot',
                  'Commercial Plot'
                ]
                    .map((propertyType) => DropdownMenuItem(
                          child: Text(propertyType),
                          value: propertyType,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPropertyType = value;
                  });
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: minSizeController,
                      decoration: InputDecoration(
                        labelText: 'Size sft (Min)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: maxSizeController,
                      decoration: InputDecoration(
                        labelText: 'Max',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                controller: minBedController,
                decoration: InputDecoration(
                  labelText: 'Min No. of Bed',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: minPriceController,
                      decoration: InputDecoration(
                        labelText: 'Price (Min)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: maxPriceController,
                      decoration: InputDecoration(
                        labelText: 'Max',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: isCustomer,
                    onChanged: (value) {
                      setState(() {
                        isCustomer = value!;
                      });
                    },
                  ),
                  Text('Customer'),
                  SizedBox(width: 16),
                  Checkbox(
                    value: isSeller,
                    onChanged: (value) {
                      setState(() {
                        isSeller = value!;
                      });
                    },
                  ),
                  Text('Seller'),
                ],
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Project Area',
                  border: OutlineInputBorder(),
                ),
                value: selectedCity,
                items: ['Dhaka', 'Chittagong', 'Sylhet']
                    .map((city) => DropdownMenuItem(
                          child: Text(city),
                          value: city,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCity = value;
                  });
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select District',
                  border: OutlineInputBorder(),
                ),
                value: selectedDistrict,
                items: ['District 1', 'District 2', 'District 3']
                    .map((district) => DropdownMenuItem(
                          child: Text(district),
                          value: district,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDistrict = value;
                  });
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select Sub-district',
                  border: OutlineInputBorder(),
                ),
                value: selectedSubDistrict,
                items: ['Sub-district 1', 'Sub-district 2', 'Sub-district 3']
                    .map((subDistrict) => DropdownMenuItem(
                          child: Text(subDistrict),
                          value: subDistrict,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSubDistrict = value;
                  });
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Filter logic
                      },
                      child: Text('FILTER'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: _clearFilters, // Calls the clear function
                      child: Text('CLEAR'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: BackFloatingbutton(
        onPerssed: () {
          Get.back();
        },
      ),
    );
  }
}
