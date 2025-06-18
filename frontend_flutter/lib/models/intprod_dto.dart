class IntProdDto {
  final String name;
  final String description;
  final List<String> gallery;
  final double price;
  final double discountValue;
  final bool hasDiscount;
  final Map<String, dynamic> details;

  IntProdDto({
    required this.name,
    required this.description,
    required this.gallery,
    required this.price,
    required this.discountValue,
    required this.hasDiscount,
    required this.details,
  });

  factory IntProdDto.fromJson(Map<String, dynamic> json) {
    return IntProdDto(
      name: json['name'],
      description: json['description'],
      gallery: List<String>.from(json['gallery']),
      price: double.parse(json['price'].toString()),
      discountValue: double.parse(json['discountValue'].toString()),
      hasDiscount: json['hasDiscount'],
      details: Map<String, dynamic>.from(json['details']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'gallery': gallery,
      'price': price.toString(),
      'discountValue': discountValue.toString(),
      'hasDiscount': hasDiscount,
      'details': details,
    };
  }
}
