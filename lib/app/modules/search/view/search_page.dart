import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? selectedLocation;
  String? selectedPropertyType;

  List<String> locations = [
    'Dhaka',
    'Chittagong',
    'Khulna',
    'Sylhet',
    'Rajshahi'
  ];

  List<String> propertyTypes = [
    'Apartment/Flats',
    'Independent House',
    'Duplex/Home',
    'Shop/Restaurant',
    'Office Space',
    'Residential Space',
    'Commercial Plot',
    'Agriculture/Firm'
  ];

  List searchResults = [];

  void performSearch() {
    setState(() {
      searchResults =
          locations.where((location) => location == selectedLocation).toList();
    });
    Fluttertoast.showToast(
        msg: 'Searching for $selectedLocation and $selectedPropertyType');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Search your PROPERTIES here',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: DropdownButtonFormField<String>(
                      value: selectedLocation,
                      hint: Text('Location'),
                      onChanged: (value) {
                        setState(() {
                          selectedLocation = value;
                        });
                      },
                      items: locations.map((location) {
                        return DropdownMenuItem(
                          value: location,
                          child: Text(location),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        border: InputBorder.none, // Remove the border
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                      isExpanded: true,
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    width: 2,
                  ),
                  Expanded(
                    flex: 2,
                    child: DropdownButtonFormField<String>(
                      value: selectedPropertyType,
                      hint: Text('Property Type'),
                      onChanged: (value) {
                        setState(() {
                          selectedPropertyType = value;
                        });
                      },
                      items: propertyTypes.map((property) {
                        return DropdownMenuItem<String>(
                          value: property,
                          child: Text(
                            property,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        border: InputBorder.none, // Remove the border
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                      isExpanded: true,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        if (selectedLocation != null &&
                            selectedPropertyType != null) {
                          performSearch();
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text(
                                    'Please select both location and property type'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
