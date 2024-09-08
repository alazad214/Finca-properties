class BookingItemModel {
  final int id;
  final String title;

  BookingItemModel({required this.id, required this.title});

  factory BookingItemModel.fromJson(Map<String, dynamic> json) {
    return BookingItemModel(
      id: json['id'],
      title: json['title'],
    );
  }
}
