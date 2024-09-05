class FincaPropertyModel {
  int id;
  String? propertyTypeName; // Nullable field
  String? cityName;
  String? areaName;
  List<Eminity>? eminities;
  String? address;
  String? propertyName;
  String? size;
  String? price;
  String? totalPrice;
  String? facing;
  String? furnished;
  String? handoverDate;
  String? description;
  String? featuredImage;
  String? mapLocation;
  String? status;
  String? constructionStatus;
  String? priceType; // Added
  String? otherCost; // Added
  String? sizeKatha; // Added
  String? bedroom; // Added
  String? bathroom; // Added
  String? balconies; // Added
  String? garages; // Added
  String? floor; // Added
  String? totalFloor; // Added

  FincaPropertyModel({
    required this.priceType,
    required this.otherCost,
    required this.sizeKatha,
    required this.bedroom,
    required this.bathroom,
    required this.balconies,
    required this.garages,
    required this.floor,
    required this.totalFloor,
    required this.id,
    this.propertyTypeName,
    this.cityName,
    this.areaName,
    this.eminities,
    this.address,
    this.propertyName,
    this.size,
    this.price,
    this.totalPrice,
    this.facing,
    this.furnished,
    this.handoverDate,
    this.description,
    this.featuredImage,
    this.mapLocation,
    this.status,
    this.constructionStatus,
  });

  factory FincaPropertyModel.fromJson(Map<String, dynamic> json) {
    return FincaPropertyModel(
      id: json['id'],
      propertyTypeName: json['property_type_name'] ?? 'N/A', // Default value
      cityName: json['city_name'] ?? 'N/A',
      areaName: json['area_name'] ?? 'N/A',
      eminities: (json['eminities'] as List?)
              ?.map((e) => Eminity.fromJson(e))
              .toList() ??
          [],
      address: json['address'] ?? 'N/A',
      propertyName: json['property_name'] ?? 'N/A',
      size: json['size'] ?? 'N/A',
      price: json['price'] ?? 'N/A',
      priceType: json['price_type'] ?? 'N/A', // Added
      otherCost: json['other_cost'] ?? 'N/A', // Added
      totalPrice: json['total_price'] ?? 'N/A',
      sizeKatha: json['size_katha'] ?? 'N/A', // Added
      bedroom: json['bedroom']?.toString() ?? 'N/A', // Added
      bathroom: json['bathroom']?.toString() ?? 'N/A', // Added
      balconies: json['belconies']?.toString() ?? 'N/A', // Added
      garages: json['garages'] ?? 'N/A', // Added
      floor: json['floor']?.toString() ?? 'N/A', // Added
      totalFloor: json['total_floor']?.toString() ?? 'N/A', // Added
      facing: json['facing'] ?? 'N/A',
      furnished: json['furnished'] ?? 'N/A',
      handoverDate: json['handover_date'] ?? 'N/A',
      description: json['description'] ?? 'N/A',
      featuredImage: json['featured_image'] ?? '',
      mapLocation: json['map_location'] ?? '',
      status: json['status'] ?? 'N/A',
      constructionStatus: json['construction_status'] ?? 'Unknown',
    );
  }
}

class Eminity {
  int id;
  String name;

  Eminity({required this.id, required this.name});

  factory Eminity.fromJson(Map<String, dynamic> json) {
    return Eminity(
      id: json['id'],
      name: json['name'] ?? 'Unknown', // Default value for null
    );
  }
}
