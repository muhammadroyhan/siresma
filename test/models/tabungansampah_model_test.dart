import 'package:flutter_test/flutter_test.dart';
import 'package:siresma/models/tabungan_sampah.dart'; // Adjust the import path as necessary

void main() {
  group('TabunganModel', () {
    final testTrashStoreLogList = [
      TrashStoreLog(
        id: 1,
        userId: 101,
        status: 'completed',
        trashBankId: 1001,
        userBalance: 150,
        adminBalance: 300,
        storeDate: '2024-07-19',
        createdAt: DateTime.parse('2024-07-19T10:00:00Z'),
        updatedAt: DateTime.parse('2024-07-19T12:00:00Z'),
        trashCategory: 'Plastic',
        iot: TrashIoT(
          id: 1,
          code: 'QR123',
          weight: 5.5,
        ),
      ),
    ];

    final testTabunganModel = TabunganModel(
      success: true,
      message: 'Data retrieved successfully',
      data: TabunganData(
        userBalance: 500,
        trashStoreLogs: testTrashStoreLogList,
      ),
    );

    group('Validation', () {
      test('TabunganModel properties should match expected values', () {
        // Validate properties directly
        expect(testTabunganModel.success, isTrue);
        expect(
            testTabunganModel.message, equals('Data retrieved successfully'));

        final data = testTabunganModel.data;
        expect(data.userBalance, equals(500));
        expect(data.trashStoreLogs.length, equals(1));

        final log = data.trashStoreLogs[0];
        expect(log.id, equals(1));
        expect(log.userId, equals(101));
        expect(log.status, equals('completed'));
        expect(log.trashBankId, equals(1001));
        expect(log.userBalance, equals(150));
        expect(log.adminBalance, equals(300));
        expect(log.storeDate, equals('2024-07-19'));
        expect(log.createdAt, equals(DateTime.parse('2024-07-19T10:00:00Z')));
        expect(log.updatedAt, equals(DateTime.parse('2024-07-19T12:00:00Z')));
        expect(log.trashCategory, equals('Plastic'));

        final iot = log.iot;
        expect(iot?.id, equals(1));
        expect(iot?.code, equals('QR123'));
        expect(iot?.weight, equals(5.5));
      });
    });
  });
}
