class ProductEntity {
  String name;
  String description;
  num price;
  String image;

  ProductEntity({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  factory ProductEntity.fromMap(Map<String, dynamic> map) {
    return ProductEntity(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? 0,
      image: map['image'] ?? '',
    );
  }
}
