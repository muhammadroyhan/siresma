class TrashStoreResponse {
  final bool success;
  final String message;
  final TrashStoreData data;

  TrashStoreResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory TrashStoreResponse.fromJson(Map<String, dynamic> json) {
    return TrashStoreResponse(
      success: json['success'],
      message: json['message'],
      data: TrashStoreData.fromJson(json['data']),
    );
  }
}

class TrashStoreData {
  final int userBalance;
  final List<TrashStoreLog> trashStoreLogs;

  TrashStoreData({
    required this.userBalance,
    required this.trashStoreLogs,
  });

  factory TrashStoreData.fromJson(Map<String, dynamic> json) {
    return TrashStoreData(
      userBalance: json['user_balance'],
      trashStoreLogs: (json['trash_store_logs'] as List)
          .map((log) => TrashStoreLog.fromJson(log))
          .toList(),
    );
  }
}

class TrashStoreLog {
  final int id;
  final int userId;
  final String status;
  final int trashBankId;
  final int? userBalance;
  final int? adminBalance;
  final String storeDate;
  final String createdAt;
  final String updatedAt;
  final String trashCategory;
  final TrashIoT? iot;

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
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
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
