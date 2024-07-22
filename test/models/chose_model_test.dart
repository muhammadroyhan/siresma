import 'package:flutter_test/flutter_test.dart';
import 'package:siresma/models/chose_location.dart'; // Adjust the import path as necessary

void main() {
  group('ChoseLocation', () {
    final testChoseLocation = ChoseLocation(
      success: true,
      message: 'Location chosen successfully',
      data: {'latitude': 37.7749, 'longitude': -122.4194},
    );

    group('toJson', () {
      test('object should be converted to Map', () {
        final jsonMap = {
          'success': true,
          'message': 'Location chosen successfully',
          'data': {'latitude': 37.7749, 'longitude': -122.4194},
        };

        final result = testChoseLocation.toJson();
        expect(result, equals(jsonMap));
      });
    });

    group('fromJson', () {
      test('Map should be converted to object', () {
        final jsonMap = {
          'success': true,
          'message': 'Location chosen successfully',
          'data': {'latitude': 37.7749, 'longitude': -122.4194},
        };

        final result = ChoseLocation.fromJson(jsonMap);
        expect(result.success, equals(true));
        expect(result.message, equals('Location chosen successfully'));
        expect(result.data, equals({'latitude': 37.7749, 'longitude': -122.4194}));
      });
    });
  });
}
