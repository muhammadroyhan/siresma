import 'package:flutter_test/flutter_test.dart';
import 'package:siresma/models/setor_sampah.dart'; // Adjust the import path as necessary

void main() {
  group('PostTrashModel', () {
    final testTrashDataList = [
      TrashData(
        trashCategoryId: 1,
        trashBankId: 101,
        storeDate: '2024-07-19',
      ),
      TrashData(
        trashCategoryId: 2,
        trashBankId: 102,
        storeDate: '2024-07-20',
      ),
    ];

    final testPostTrashModel = PostTrashModel(
      success: true,
      message: 'Data posted successfully',
      data: testTrashDataList,
    );

    group('toJson', () {
      test('object should be converted to Map', () {
        final jsonMap = {
          'success': true,
          'message': 'Data posted successfully',
          'data': [
            {
              'trash_category_id': 1,
              'trash_bank_id': 101,
              'store_date': '2024-07-19',
            },
            {
              'trash_category_id': 2,
              'trash_bank_id': 102,
              'store_date': '2024-07-20',
            },
          ],
        };

        final result = testPostTrashModel.toJson();
        expect(result, equals(jsonMap));
      });
    });

    group('fromJson', () {
      test('Map should be converted to object', () {
        final jsonMap = {
          'success': true,
          'message': 'Data posted successfully',
          'data': [
            {
              'trash_category_id': 1,
              'trash_bank_id': 101,
              'store_date': '2024-07-19',
            },
            {
              'trash_category_id': 2,
              'trash_bank_id': 102,
              'store_date': '2024-07-20',
            },
          ],
        };

        final result = PostTrashModel.fromJson(jsonMap);

        expect(result.success, equals(true));
        expect(result.message, equals('Data posted successfully'));
        expect(result.data.length, equals(2));
        expect(result.data[0].trashCategoryId, equals(1));
        expect(result.data[0].trashBankId, equals(101));
        expect(result.data[0].storeDate, equals('2024-07-19'));
        expect(result.data[1].trashCategoryId, equals(2));
        expect(result.data[1].trashBankId, equals(102));
        expect(result.data[1].storeDate, equals('2024-07-20'));
      });
    });
  });
}
