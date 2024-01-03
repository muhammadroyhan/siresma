import 'package:get/get.dart';

import '../controllers/tarik_saldo_controller.dart';

class TarikSaldoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TarikSaldoController>(
      () => TarikSaldoController(),
    );
  }
}
