import 'package:flutter_test/flutter_test.dart';
import 'package:siresma/models/edit_profil.dart'; // Adjust the import path as necessary

void main() {
  group('EditProfilModel', () {
    final testEditProfilModel = EditProfilModel(
      success: true,
      message: 'Profile updated successfully',
      data: 123,
    );

    group('toJson', () {
      test('object should be converted to Map', () {
        final jsonMap = {
          'success': true,
          'message': 'Profile updated successfully',
          'data': 123,
        };

        final result = testEditProfilModel.toJson();
        expect(result, equals(jsonMap));
      });
    });

    group('fromJson', () {
      test('Map should be converted to object', () {
        final jsonMap = {
          'success': true,
          'message': 'Profile updated successfully',
          'data': 123,
        };

        final result = EditProfilModel.fromJson(jsonMap);
        expect(result.success, equals(true));
        expect(result.message, equals('Profile updated successfully'));
        expect(result.data, equals(123));
      });
    });
  });
}
