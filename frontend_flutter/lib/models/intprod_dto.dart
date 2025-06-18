class IntProdDto {
  final String name;
  final String description;
  final String categoria;
  final List<String> gallery;
  final double price;
  final double discountValue;
  final bool hasDiscount;
  final Map<String, dynamic> details;

  IntProdDto({
    required this.name,
    required this.description,
    required this.categoria,
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
      categoria: json['categoria'],
      gallery: List<String>.from(json['gallery']),
      price: (json['price'] as num).toDouble(),
      discountValue: (json['discountValue'] as num).toDouble(),
      hasDiscount: json['hasDiscount'],
      details: Map<String, dynamic>.from(json['details']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'categoria': categoria,
      'gallery': gallery,
      'price': price,
      'discountValue': discountValue,
      'hasDiscount': hasDiscount,
      'details': details,
    };
  }
}
