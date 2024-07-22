import 'package:flutter_test/flutter_test.dart';
import 'package:siresma/models/detailnasabah.dart'; // Adjust the import path as necessary

void main() {
  group('DetailNasabahModel', () {
    group('fromJson', () {
      test('Map should be converted to object', () {
        final jsonMap = {
          'data': {
            'id': 1,
            'full_name': 'John Doe',
            'phone': '1234567890',
            'address': '123 Main St',
            'profile_picture': 'path/to/profile.jpg',
            'no_kk': '123456789',
          }
        };

        final result = DetailNasabahModel.fromJson(jsonMap);
        expect(result.id, equals(1));
        expect(result.fullName, equals('John Doe'));
        expect(result.phone, equals('1234567890'));
        expect(result.address, equals('123 Main St'));
        expect(result.profilePicture, equals('path/to/profile.jpg'));
        expect(result.noKk, equals('123456789'));
      });
    });
  });
}
