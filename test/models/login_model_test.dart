import 'package:siresma/models/login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginModel', () {
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

    final testLoginModel = LoginModel(
      success: true,
      message: 'Login successful',
      token: 'abc123token',
      data: userData,
    );

    group('toJson', () {
      test('object should be converted to Map', () {
        final jsonMap = {
          'success': true,
          'message': 'Login successful',
          'token': 'abc123token',
          'data': {
            'id': 1,
            'full_name': 'John Doe',
            'role': 'user',
            'phone': '1234567890',
            'address': '123 Main St',
            'location': 'City',
            'no_kk': '123456789',
            'profile_picture': 'path/to/profile.jpg'
          }
        };

        final result = {
          'success': testLoginModel.success,
          'message': testLoginModel.message,
          'token': testLoginModel.token,
          'data': testLoginModel.data.toJson(),
        };
        expect(result, equals(jsonMap));
      });
    });

    group('fromJson', () {
      test('Map should be converted to object', () {
        final jsonMap = {
          'success': true,
          'message': 'Login successful',
          'token': 'abc123token',
          'data': {
            'id': 1,
            'full_name': 'John Doe',
            'role': 'user',
            'phone': '1234567890',
            'address': '123 Main St',
            'location': 'City',
            'no_kk': '123456789',
            'profile_picture': 'path/to/profile.jpg'
          }
        };

        final result = LoginModel.fromJson(jsonMap);
        expect(result.success, equals(true));
        expect(result.message, equals('Login successful'));
        expect(result.token, equals('abc123token'));
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
