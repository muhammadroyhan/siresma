import 'package:flutter_test/flutter_test.dart';
import 'package:siresma/models/otp.dart'; // Adjust the import path as necessary

void main() {
  group('OtpModel', () {
    final testOtpModel = OtpModel(
      success: true,
      message: 'OTP sent successfully',
      data: {'otp': '123456'},
    );

    group('toJson', () {
      test('object should be converted to Map', () {
        final jsonMap = {
          'success': true,
          'message': 'OTP sent successfully',
          'data': {'otp': '123456'},
        };

        final result = testOtpModel.toJson();
        expect(result, equals(jsonMap));
      });
    });

    group('fromJson', () {
      test('Map should be converted to object', () {
        final jsonMap = {
          'success': true,
          'message': 'OTP sent successfully',
          'data': {'otp': '123456'},
        };

        final result = OtpModel.fromJson(jsonMap);

        expect(result.success, equals(true));
        expect(result.message, equals('OTP sent successfully'));
        expect(result.data, equals({'otp': '123456'}));
      });
    });
  });
}
