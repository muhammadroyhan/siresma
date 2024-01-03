class TransactionResponse {
  final bool success;
  final String message;
  final TransactionData data;

  TransactionResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) {
    return TransactionResponse(
      success: json['success'],
      message: json['message'],
      data: TransactionData.fromJson(json['data']),
    );
  }
}

class TransactionData {
  final int userBalance;
  final String oldest_data_month;
  final String newest_data_month;
  final List<TransactionItem> transactionList;

  TransactionData({
    required this.userBalance,
    required this.oldest_data_month,
    required this.newest_data_month,
    required this.transactionList,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) {
    return TransactionData(
      userBalance: json['user_balance'],
      oldest_data_month: json['oldest_data_month'],
      newest_data_month: json['newest_data_month'],
      transactionList: (json['transaction_list'] as List)
          .map((item) => TransactionItem.fromJson(item))
          .toList(),
    );
  }
}

class TransactionItem {
  final int id;
  final String code;
  final String type;
  final int userId;
  // final int? garbageSavingsDataId;
  final int trashBankId;
  final int amount;
  final int isApproved;
  final String createdAt;
  final int day;
  final int month;
  final int year;
  final String updatedAt;

  TransactionItem({
    required this.id,
    required this.code,
    required this.type,
    required this.userId,
    // required this.garbageSavingsDataId,
    required this.trashBankId,
    required this.amount,
    required this.isApproved,
    required this.createdAt,
    required this.day,
    required this.month,
    required this.year,
    required this.updatedAt,
  });

  factory TransactionItem.fromJson(Map<String, dynamic> json) {
    final createdAtParts = json['created_at'].split('T')[0].split('-');

    return TransactionItem(
      id: json['id'],
      code: json['code'],
      type: json['type'],
      userId: json['user_id'],
      // garbageSavingsDataId: json['garbage_savings_data_id'],
      trashBankId: json['trash_bank_id'],
      amount: json['amount'],
      isApproved: json['is_approved'],
      createdAt: json['created_at'],
      day: int.parse(createdAtParts[2]),
      month: int.parse(createdAtParts[1]),
      year: int.parse(createdAtParts[0]),
      updatedAt: json['updated_at'],
    );
  }
}
