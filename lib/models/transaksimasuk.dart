class TransaksiMasukModel {
  final bool success;
  final String message;
  final List<TransaksiMasukData> data;

  TransaksiMasukModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory TransaksiMasukModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<TransaksiMasukData> transaksimasukList =
        dataList.map((i) => TransaksiMasukData.fromJson(i)).toList();

    return TransaksiMasukModel(
      success: json['success'],
      message: json['message'],
      data: transaksimasukList,
    );
  }
}

class TransaksiMasukData {
  final int id;
  final String code;
  final int amount;
  final String name;
  final String store_date;

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
