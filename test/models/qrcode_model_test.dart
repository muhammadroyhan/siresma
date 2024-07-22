import 'package:flutter_test/flutter_test.dart';
import 'package:siresma/models/qr_code.dart'; // Adjust the import path as necessary

void main() {
  group('QrCodeModel', () {
    final testQrCodeModel = QrCodeModel(
      success: true,
      message: 'QR code generated successfully',
      data: {'qr_code': 'https://example.com/qr_code.png'},
    );

    group('toJson', () {
      test('object should be converted to Map', () {
        final jsonMap = {
          'success': true,
          'message': 'QR code generated successfully',
          'data': {'qr_code': 'https://example.com/qr_code.png'},
        };

        final result = testQrCodeModel.toJson();
        expect(result, equals(jsonMap));
      });
    });

    group('fromJson', () {
      test('Map should be converted to object', () {
        final jsonMap = {
          'success': true,
          'message': 'QR code generated successfully',
          'data': {'qr_code': 'https://example.com/qr_code.png'},
        };

        final result = QrCodeModel.fromJson(jsonMap);

        expect(result.success, equals(true));
        expect(result.message, equals('QR code generated successfully'));
        expect(result.data,
            equals({'qr_code': 'https://example.com/qr_code.png'}));
      });
    });
  });
}
