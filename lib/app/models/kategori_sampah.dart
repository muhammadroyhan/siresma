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

class ResponseBody {
  final bool success;
  final List<Kategori> message;
  final int data;

  ResponseBody({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ResponseBody.fromJson(Map<String, dynamic> json) {
    return ResponseBody(
      success: json['success'],
      message: List<Kategori>.from(
          json['message'].map((item) => Kategori.fromJson(item))),
      data: json['data'],
    );
  }
}
