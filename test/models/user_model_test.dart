import 'package:siresma/models/user.dart'; // Adjust the import path as necessary
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserModel', () {
    final userData = UserData(
      id: 1,
      fullName: 'John Doe',
      role: 'user',
      phone: '1234567890',
      address: '123 Main St',
      location: 'City',
      noKk: '123456789',
      profilePicture: 'path/to/profile.jpg',
    );

    final testUserModel = UserModel(
      success: true,
      message: 'User data retrieved successfully',
      data: userData,
    );

    group('toJson', () {
      test('object should be converted to Map', () {
        final jsonMap = {
          'success': true,
          'message': 'User data retrieved successfully',
          'data': {
            'id': 1,
            'full_name': 'John Doe',
            'role': 'user',
            'phone': '1234567890',
            'address': '123 Main St',
            'location': 'City',
            'no_kk': '123456789',
            'profile_picture': 'path/to/profile.jpg',
          }
        };

        final result = {
          'success': testUserModel.success,
          'message': testUserModel.message,
          'data': testUserModel.data.toJson(),
        };
        expect(result, equals(jsonMap));
      });
    });

    group('fromJson', () {
      test('Map should be converted to object', () {
        final jsonMap = {
          'success': true,
          'message': 'User data retrieved successfully',
          'data': {
            'id': 1,
            'full_name': 'John Doe',
            'role': 'user',
            'phone': '1234567890',
            'address': '123 Main St',
            'location': 'City',
            'no_kk': '123456789',
            'profile_picture': 'path/to/profile.jpg',
          }
        };

        final result = UserModel.fromJson(jsonMap);
        expect(result.success, equals(true));
        expect(result.message, equals('User data retrieved successfully'));
        expect(result.data.id, equals(1));
        expect(result.data.fullName, equals('John Doe'));
        expect(result.data.role, equals('user'));
        expect(result.data.phone, equals('1234567890'));
        expect(result.data.address, equals('123 Main St'));
        expect(result.data.location, equals('City'));
        expect(result.data.noKk, equals('123456789'));
        expect(result.data.profilePicture, equals('path/to/profile.jpg'));
      });
    });
  });
}

extension UserDataExtension on UserData {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'role': role,
      'phone': phone,
      'address': address,
      'location': location,
      'no_kk': noKk,
      'profile_picture': profilePicture,
    };
  }
}
