import 'package:flutter_test/flutter_test.dart';
import 'package:siresma/models/transaksi.dart'; // Adjust import path

void main() {
  group('TransactionResponse', () {
    final testTransactionResponse = TransactionResponse(
      success: true,
      message: 'Data retrieved successfully',
      data: TransactionData(
        userBalance: 1000,
        oldest_data_month: '2024-01',
        newest_data_month: '2024-07',
        transactionList: [
          TransactionItem(
            id: 1,
            code: 'TXN123',
            type: 'credit',
            userId: 101,
            trashBankId: 202,
            amount: 500,
            isApproved: 1,
            createdAt: '2024-07-01T10:00:00Z',
            day: 1,
            month: 7,
            year: 2024,
            updatedAt: '2024-07-01T10:00:00Z',
          ),
        ],
      ),
    );

    final Map<String, dynamic> jsonMap = {
      'success': true,
      'message': 'Data retrieved successfully',
      'data': {
        'user_balance': 1000,
        'oldest_data_month': '2024-01',
        'newest_data_month': '2024-07',
        'transaction_list': [
          {
            'id': 1,
            'code': 'TXN123',
            'type': 'credit',
            'user_id': 101,
            'trash_bank_id': 202,
            'amount': 500,
            'is_approved': 1,
            'created_at': '2024-07-01T10:00:00Z',
            'day': 1,
            'month': 7,
            'year': 2024,
            'updated_at': '2024-07-01T10:00:00Z',
          },
        ],
      },
    };

    test('fromJson should create a valid model from JSON', () {
      final model = TransactionResponse.fromJson(jsonMap);

      // Check top-level properties
      expect(model.success, isTrue);
      expect(model.message, 'Data retrieved successfully');
      
      // Check nested data
      expect(model.data.userBalance, 1000);
      expect(model.data.oldest_data_month, '2024-01');
      expect(model.data.newest_data_month, '2024-07');
      expect(model.data.transactionList.length, 1);

      final transaction = model.data.transactionList.first;
      expect(transaction.id, 1);
      expect(transaction.code, 'TXN123');
      expect(transaction.type, 'credit');
      expect(transaction.userId, 101);
      expect(transaction.trashBankId, 202);
      expect(transaction.amount, 500);
      expect(transaction.isApproved, 1);
      expect(transaction.createdAt, '2024-07-01T10:00:00Z');
      expect(transaction.day, 1);
      expect(transaction.month, 7);
      expect(transaction.year, 2024);
      expect(transaction.updatedAt, '2024-07-01T10:00:00Z');
    });

    test('fromJson should handle partial data correctly', () {
      final partialJson = {
        'success': true,
        'message': 'Partial data',
        'data': {
          'user_balance': 500,
          'oldest_data_month': '2024-01',
          'newest_data_month': '2024-07',
          'transaction_list': [],
        },
      };

      final model = TransactionResponse.fromJson(partialJson);

      // Check top-level properties
      expect(model.success, isTrue);
      expect(model.message, 'Partial data');
      
      // Check nested data
      expect(model.data.userBalance, 500);
      expect(model.data.oldest_data_month, '2024-01');
      expect(model.data.newest_data_month, '2024-07');
      expect(model.data.transactionList, isEmpty);
    });
  });
}
