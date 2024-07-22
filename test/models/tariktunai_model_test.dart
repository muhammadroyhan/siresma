import 'package:flutter_test/flutter_test.dart';
import 'package:siresma/models/tariktunai.dart'; // Adjust import as necessary

void main() {
  group('TarikTunaiModel', () {
    final testTarikTunaiModel = TarikTunaiModel(
      success: true,
      message: 'Transaction successful',
      data: {
        'amount': 5000,
        'transaction_id': 'txn123456',
      },
    );

    final Map<String, dynamic> jsonMap = {
      'success': true,
      'message': 'Transaction successful',
      'data': {
        'amount': 5000,
        'transaction_id': 'txn123456',
      },
    };

    test('fromJson should create a valid model from JSON', () {
      final model = TarikTunaiModel.fromJson(jsonMap);
      expect(model.success, isTrue);
      expect(model.message, 'Transaction successful');
      expect(model.data, jsonMap['data']);
    });

    test('toJson should convert model to JSON', () {
      final jsonResult = testTarikTunaiModel.toJson();
      expect(jsonResult, equals(jsonMap));
    });
  });
}
