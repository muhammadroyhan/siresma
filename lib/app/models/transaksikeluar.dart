class ApiResponse {
  bool success;
  String message;
  TransaksiKeluarData data;

  ApiResponse(
      {required this.success, required this.message, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'],
      message: json['message'],
      data: TransaksiKeluarData.fromJson(json['data']),
    );
  }
}

class TransaksiKeluarData {
  int transaction_id;
  int id;
  String code;
  int amount;
  String name;
  String is_approved;

  TransaksiKeluarData({
    required this.transaction_id,
    required this.id,
    required this.code,
    required this.amount,
    required this.name,
    required this.is_approved,
  });

  factory TransaksiKeluarData.fromJson(Map<String, dynamic> json) {
    return TransaksiKeluarData(
      transaction_id: json['transaction_id'],
      id: json['id'],
      code: json['code'],
      amount: json['amount'],
      name: json['name'],
      is_approved: json['is_approved'],
    );
  }
}

class TransaksiKeluarList {
  static int? id;
  static String? code;
  static int? amount;
  static String? name;
  static String? is_approved;
}
