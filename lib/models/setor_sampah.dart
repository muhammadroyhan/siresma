class PostTrashModel {
  bool success;
  String message;
  List<TrashData> data;

  PostTrashModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory PostTrashModel.fromJson(Map<String, dynamic> json) {
    return PostTrashModel(
      success: json['success'],
      message: json['message'],
      data:
          List<TrashData>.from(json['data'].map((x) => TrashData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}

class TrashData {
  int trashCategoryId;
  int trashBankId;
  String storeDate;

  TrashData({
    required this.trashCategoryId,
    required this.trashBankId,
    required this.storeDate,
  });

  factory TrashData.fromJson(Map<String, dynamic> json) {
    return TrashData(
      trashCategoryId: json['trash_category_id'],
      trashBankId: json['trash_bank_id'],
      storeDate: json['store_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trash_category_id': trashCategoryId,
      'trash_bank_id': trashBankId,
      'store_date': storeDate,
    };
  }
}
