import 'package:flutter_test/flutter_test.dart';
import 'package:siresma/models/kategori_sampah.dart'; // Adjust the import path as necessary

void main() {
  group('Kategori', () {
    final testKategori = Kategori(
      id: 1,
      categoryName: 'Electronics',
      unit: 'kg',
      price: 299,
    );

    group('toJson', () {
      test('object should be converted to Map', () {
        final jsonMap = {
          'id': 1,
          'category_name': 'Electronics',
          'price': 299,
        };

        final result = {
          'id': testKategori.id,
          'category_name': testKategori.categoryName,
          'price': testKategori.price,
        };

        expect(result, equals(jsonMap));
      });
    });

    group('fromJson', () {
      test('Map should be converted to object', () {
        final jsonMap = {
          'id': 1,
          'category_name': 'Electronics',
          'price': 299,
        };

        final result = Kategori.fromJson(jsonMap);

        expect(result.id, equals(1));
        expect(result.categoryName, equals('Electronics'));
        expect(result.price, equals(299));
      });
    });
  });
}
