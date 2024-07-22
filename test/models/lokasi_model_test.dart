import 'package:flutter_test/flutter_test.dart';
import 'package:siresma/models/location.dart'; // Adjust the import path as necessary

void main() {
  group('Location', () {
    final testLocation = Location(
      id: 1,
      name: 'Downtown',
      rt: 5,
      rw: 10,
      description: 'Central area with commercial activities',
    );

    group('toJson', () {
      test('object should be converted to Map', () {
        final jsonMap = {
          'id': 1,
          'name': 'Downtown',
          'rt': 5,
          'rw': 10,
          'description': 'Central area with commercial activities',
        };

        final result = {
          'id': testLocation.id,
          'name': testLocation.name,
          'rt': testLocation.rt,
          'rw': testLocation.rw,
          'description': testLocation.description,
        };

        expect(result, equals(jsonMap));
      });
    });

    group('fromJson', () {
      test('Map should be converted to object', () {
        final jsonMap = {
          'id': 1,
          'name': 'Downtown',
          'rt': 5,
          'rw': 10,
          'description': 'Central area with commercial activities',
        };

        final result = Location.fromJson(jsonMap);

        expect(result.id, equals(1));
        expect(result.name, equals('Downtown'));
        expect(result.rt, equals(5));
        expect(result.rw, equals(10));
        expect(result.description,
            equals('Central area with commercial activities'));
      });
    });
  });
}
