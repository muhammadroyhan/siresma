class TabunganModel {
  bool success;
  String message;
  TabunganData data;

  TabunganModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory TabunganModel.fromJson(Map<String, dynamic> json) {
    return TabunganModel(
      success: json['success'],
      message: json['message'],
      data: TabunganData.fromJson(json['data']),
    );
  }
}

class TabunganData {
  int userBalance;
  List<TrashStoreLog> trashStoreLogs;

  TabunganData({
    required this.userBalance,
    required this.trashStoreLogs,
  });

  factory TabunganData.fromJson(Map<String, dynamic> json) {
    var list = json['trash_store_logs'] as List;
    List<TrashStoreLog> trashStoreLogsList =
        list.map((i) => TrashStoreLog.fromJson(i)).toList();

    return TabunganData(
      userBalance: json['user_balance'],
      trashStoreLogs: trashStoreLogsList,
    );
  }
}

class TrashStoreLog {
  int id;
  int userId;
  String status;
  int trashBankId;
  int? userBalance;
  int? adminBalance;
  String storeDate;
  DateTime createdAt;
  DateTime updatedAt;
  String trashCategory;
  TrashIoT? iot;

  TrashStoreLog({
    required this.id,
    required this.userId,
    required this.status,
    required this.trashBankId,
    required this.userBalance,
    required this.adminBalance,
    required this.storeDate,
    required this.createdAt,
    required this.updatedAt,
    required this.trashCategory,
    required this.iot,
  });

  factory TrashStoreLog.fromJson(Map<String, dynamic> json) {
    return TrashStoreLog(
      id: json['id'],
      userId: json['user_id'],
      status: json['status'],
      trashBankId: json['trash_bank_id'],
      userBalance: json['user_balance'],
      adminBalance: json['admin_balance'],
      storeDate: json['store_date'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      trashCategory: json['trash_category'],
      iot: json['iot'] != null ? TrashIoT.fromJson(json['iot']) : null,
    );
  }
}

class TrashIoT {
  final int id;
  final String code;
  final double weight;

  TrashIoT({
    required this.id,
    required this.code,
    required this.weight,
  });

  factory TrashIoT.fromJson(Map<String, dynamic> json) {
    return TrashIoT(
      id: json['id'],
      code: json['code'],
      weight: json['weight'] is int
          ? (json['weight'] as int).toDouble()
          : json['weight'],
    );
  }
}
