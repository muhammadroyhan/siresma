import 'package:flutter_test/flutter_test.dart';
import 'package:siresma/models/datanasabah.dart'; // Adjust the import path as necessary

void main() {
  group('DataNasabahResponse', () {
    final dataNasabahList = [
      DataNasabah(
        id: 1,
        fullName: 'John Doe',
        profilePicture: 'path/to/profile1.jpg',
        phone: '1234567890',
      ),
      DataNasabah(
        id: 2,
        fullName: 'Jane Smith',
        profilePicture: 'path/to/profile2.jpg',
        phone: '0987654321',
      ),
    ];

    final testDataNasabahResponse = DataNasabahResponse(
      success: true,
      message: 'Data retrieved successfully',
      data: dataNasabahList,
    );

    group('toJson', () {
      test('object should be converted to Map', () {
        final jsonMap = {
          'success': true,
          'message': 'Data retrieved successfully',
          'data': [
            {
              'id': 1,
              'full_name': 'John Doe',
              'profile_picture': 'path/to/profile1.jpg',
              'phone': '1234567890',
            },
            {
              'id': 2,
              'full_name': 'Jane Smith',
              'profile_picture': 'path/to/profile2.jpg',
              'phone': '0987654321',
            }
          ]
        };

        final result = {
          'success': testDataNasabahResponse.success,
          'message': testDataNasabahResponse.message,
          'data': testDataNasabahResponse.data.map((e) => e.toJson()).toList(),
        };

        expect(result, equals(jsonMap));
      });
    });

    group('fromJson', () {
      test('Map should be converted to object', () {
        final jsonMap = {
          'success': true,
          'message': 'Data retrieved successfully',
          'data': [
            {
              'id': 1,
              'full_name': 'John Doe',
              'profile_picture': 'path/to/profile1.jpg',
              'phone': '1234567890',
            },
            {
              'id': 2,
              'full_name': 'Jane Smith',
              'profile_picture': 'path/to/profile2.jpg',
              'phone': '0987654321',
            }
          ]
        };

        final result = DataNasabahResponse.fromJson(jsonMap);

        expect(result.success, equals(true));
        expect(result.message, equals('Data retrieved successfully'));
        expect(result.data.length, equals(2));
        expect(result.data[0].id, equals(1));
        expect(result.data[0].fullName, equals('John Doe'));
        expect(result.data[0].profilePicture, equals('path/to/profile1.jpg'));
        expect(result.data[0].phone, equals('1234567890'));
        expect(result.data[1].id, equals(2));
        expect(result.data[1].fullName, equals('Jane Smith'));
        expect(result.data[1].profilePicture, equals('path/to/profile2.jpg'));
        expect(result.data[1].phone, equals('0987654321'));
      });
    });
  });
}

extension DataNasabahExtension on DataNasabah {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'profile_picture': profilePicture,
      'phone': phone,
    };
  }
}
