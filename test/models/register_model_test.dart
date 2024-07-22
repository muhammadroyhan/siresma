import 'package:siresma/models/register.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  RegisterModel testRegisterModel = RegisterModel(
    success: true,
    message: 'Registration successful',
    data: 123,
  );

  group('toJson', () {
    test('object should be converted to Map', () {
      final jsonMap = {
        'success': true,
        'message': 'Registration successful',
        'data': 123
      };

      final result = testRegisterModel.toJson();
      expect(result, equals(jsonMap));
    });
  });

  group('fromJson', () {
    test('Map should be converted to object', () {
      final jsonMap = {
        'success': true,
        'message': 'Registration successful',
        'data': 123
      };

      final result = RegisterModel.fromJson(jsonMap);
      expect(result.success, equals(true));
      expect(result.message, equals('Registration successful'));
      expect(result.data, equals(123));
    });
  });
}
