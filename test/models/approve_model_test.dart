import 'package:flutter_test/flutter_test.dart';
import 'package:siresma/models/approve_dana.dart'; // Adjust the import path as necessary

void main() {
  group('ApproveDanaModel', () {
    final testApproveDanaModel = ApproveDanaModel(
      success: true,
      message: 'Approval successful',
      data: {'amount': 1000, 'currency': 'USD'},
    );

    group('toJson', () {
      test('object should be converted to Map', () {
        final jsonMap = {
          'success': true,
          'message': 'Approval successful',
          'data': {'amount': 1000, 'currency': 'USD'}
        };

        final result = testApproveDanaModel.toJson();
        expect(result, equals(jsonMap));
      });
    });

    group('fromJson', () {
      test('Map should be converted to object', () {
        final jsonMap = {
          'success': true,
          'message': 'Approval successful',
          'data': {'amount': 1000, 'currency': 'USD'}
        };

        final result = ApproveDanaModel.fromJson(jsonMap);
        expect(result.success, equals(true));
        expect(result.message, equals('Approval successful'));
        expect(result.data, equals({'amount': 1000, 'currency': 'USD'}));
      });
    });
  });
}
