class ApiResponse {
  bool success;
  String message;
  TransaksiMasukData data;

  ApiResponse(
      {required this.success, required this.message, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'],
      message: json['message'],
      data: TransaksiMasukData.fromJson(json['data']),
    );
  }
}

class TransaksiMasukData {
  int id;
  String code;
  int amount;
  String name;
  String store_date;

  TransaksiMasukData({
    required this.id,
    required this.code,
    required this.amount,
    required this.name,
    required this.store_date,
  });

  factory TransaksiMasukData.fromJson(Map<String, dynamic> json) {
    return TransaksiMasukData(
      id: json['id'],
      code: json['code'],
      amount: json['amount'],
      name: json['name'],
      store_date: json['store_date'],
    );
  }
}

class TransaksiMasukList {
  static int? id;
  static String? code;
  static int? amount;
  static String? name;
  static String? store_date;
}
