class TransactionAdminModel {
  final bool success;
  final String message;
  final TransactionAdminData data;

  TransactionAdminModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory TransactionAdminModel.fromJson(Map<String, dynamic> json) {
    return TransactionAdminModel(
      success: json['success'],
      message: json['message'],
      data: TransactionAdminData.fromJson(json['data']),
    );
  }
}

class TransactionAdminData {
  final List<TransactionAdminItem> items;
  final int totalIncome;
  final int userIncome;
  final int adminIncome;

  TransactionAdminData({
    required this.items,
    required this.totalIncome,
    required this.userIncome,
    required this.adminIncome,
  });

  factory TransactionAdminData.fromJson(Map<String, dynamic> json) {
    List<TransactionAdminItem> items = [];
    json.forEach((key, value) {
      if (key != 'total_income' &&
          key != 'user_income' &&
          key != 'admin_income') {
        items.add(TransactionAdminItem.fromJson(value));
      }
    });

    return TransactionAdminData(
      items: items,
      totalIncome: json['total_income'],
      userIncome: json['user_income'],
      adminIncome: json['admin_income'],
    );
  }
}

class TransactionAdminItem {
  final int id;
  final String code;
  final String type;
  final int trashBankId;
  final int amount;
  final String createdAt;
  final int day;
  final int month;
  final int year;
  final String updatedAt;
  final double? weight;

  TransactionAdminItem({
    required this.id,
    required this.code,
    required this.type,
    required this.trashBankId,
    required this.amount,
    required this.createdAt,
    required this.day,
    required this.month,
    required this.year,
    required this.updatedAt,
    this.weight,
  });

  factory TransactionAdminItem.fromJson(Map<String, dynamic> json) {
    final createdAtParts = json['created_at'].split('T')[0].split('-');

    return TransactionAdminItem(
      id: json['id'],
      code: json['code'],
      type: json['type'],
      trashBankId: json['trash_bank_id'],
      amount: json['amount'],
      createdAt: json['created_at'],
      day: int.parse(createdAtParts[2]),
      month: int.parse(createdAtParts[1]),
      year: int.parse(createdAtParts[0]),
      updatedAt: json['updated_at'],
      weight: json['weight']?.toDouble(),
    );
  }
}
