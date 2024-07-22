import 'package:flutter_test/flutter_test.dart';
import 'package:siresma/models/home.dart'; // Adjust the import path as necessary

void main() {
  group('HomeModel', () {
    final testHomeData = HomeData(
      id: 1,
      name: 'Home Name',
      description: 'Description of the home',
    );

    final testHomeModel = HomeModel(
      success: true,
      message: 'Data retrieved successfully',
      data: testHomeData,
    );

    group('toJson', () {
      test('object should be converted to Map', () {
        final jsonMap = {
          'success': true,
          'message': 'Data retrieved successfully',
          'data': {
            'id': 1,
            'name': 'Home Name',
            'description': 'Description of the home',
          }
        };

        final result = {
          'success': testHomeModel.success,
          'message': testHomeModel.message,
          'data': testHomeModel.data.toJson(),
        };

        expect(result, equals(jsonMap));
      });
    });

    group('fromJson', () {
      test('Map should be converted to object', () {
        final jsonMap = {
          'success': true,
          'message': 'Data retrieved successfully',
          'data': {
            'id': 1,
            'name': 'Home Name',
            'description': 'Description of the home',
          }
        };

        final result = HomeModel.fromJson(jsonMap);

        expect(result.success, equals(true));
        expect(result.message, equals('Data retrieved successfully'));
        expect(result.data.id, equals(1));
        expect(result.data.name, equals('Home Name'));
        expect(result.data.description, equals('Description of the home'));
      });
    });
  });
}

extension HomeDataExtension on HomeData {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
