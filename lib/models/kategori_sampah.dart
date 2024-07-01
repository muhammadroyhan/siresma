class Kategori {
  final int id;
  final String categoryName;
  final int price;

  Kategori({
    required this.id,
    required this.categoryName,
    required this.price,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return Kategori(
      id: json['id'],
      categoryName: json['category_name'],
      price: json['price'],
    );
  }
}
