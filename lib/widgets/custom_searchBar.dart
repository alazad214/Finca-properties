import 'package:flutter/material.dart';

class PropertySearch extends StatefulWidget {
  @override
  _PropertySearchState createState() => _PropertySearchState();
}

class _PropertySearchState extends State<PropertySearch> {
  String? selectedLocation;
  String? selectedPropertyType;

  List<String> locations = [
    'Dhaka',
    'Chittagong',
    'Khulna',
    'Sylhet',
    'Rajshahi'
  ];

  List propertyTypes = [
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
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
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

            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
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
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),

                      // Dropdown for Property Type
                      DropdownButtonFormField<String>(
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
                            child: Text(property),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      if (selectedLocation != null &&
                          selectedPropertyType != null) {
                        performSearch();
                        print(
                            'Searching for $selectedLocation and $selectedPropertyType');
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
            SizedBox(height: 20),

            // Display search results
            searchResults.isNotEmpty
                ? ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Property in ${searchResults[index]}'),
                      );
                    },
                  )
                : Text('No results found'),
          ],
        ),
      ),
    );
  }
}
