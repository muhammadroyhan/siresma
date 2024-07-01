class TransaksiKeluarModel {
  final bool success;
  final String message;
  final List<TransaksiKeluarData> data;

  TransaksiKeluarModel(
      {required this.success, required this.message, required this.data});

  factory TransaksiKeluarModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<TransaksiKeluarData> transaksikeluarList =
        dataList.map((i) => TransaksiKeluarData.fromJson(i)).toList();
    return TransaksiKeluarModel(
      success: json['success'],
      message: json['message'],
      data: transaksikeluarList,
    );
  }
}

class TransaksiKeluarData {
  // int transaction_id;
  int id;
  String code;
  int amount;
  String name;
  int is_approved;

  TransaksiKeluarData({
    // required this.transaction_id,
    required this.id,
    required this.code,
    required this.amount,
    required this.name,
    required this.is_approved,
  });

  factory TransaksiKeluarData.fromJson(Map<String, dynamic> json) {
    return TransaksiKeluarData(
      // transaction_id: json['transaction_id'],
      id: json['id'],
      code: json['code'],
      amount: json['amount'],
      name: json['name'],
      is_approved: json['is_approved'],
    );
  }
}
