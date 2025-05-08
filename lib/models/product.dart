class Product {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;
  final double? rating;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final ratingData = json['rating'];
    return Product(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      rating: ratingData != null ? (ratingData['rate'] ?? 0).toDouble() : 0.0,
    );
  }
}
