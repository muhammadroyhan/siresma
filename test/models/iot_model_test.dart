import 'package:flutter_test/flutter_test.dart';
import 'package:siresma/models/iot.dart'; // Adjust the import path as necessary

void main() {
  group('IotModel', () {
    final testIotModel = IotModel(
      success: true,
      message: 'Data retrieved successfully',
      data: {'sensor': 'temperature', 'value': 22.5},
    );

    group('toJson', () {
      test('object should be converted to Map', () {
        final jsonMap = {
          'success': true,
          'message': 'Data retrieved successfully',
          'data': {'sensor': 'temperature', 'value': 22.5},
        };

        final result = testIotModel.toJson();
        expect(result, equals(jsonMap));
      });
    });

    group('fromJson', () {
      test('Map should be converted to object', () {
        final jsonMap = {
          'success': true,
          'message': 'Data retrieved successfully',
          'data': {'sensor': 'temperature', 'value': 22.5},
        };

        final result = IotModel.fromJson(jsonMap);

        expect(result.success, equals(true));
        expect(result.message, equals('Data retrieved successfully'));
        expect(result.data, equals({'sensor': 'temperature', 'value': 22.5}));
      });
    });
  });
}
