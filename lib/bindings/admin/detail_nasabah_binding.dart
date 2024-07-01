import 'package:get/get.dart';
import 'package:siresma/view_models/admin/detail_nasabah_view_model.dart';

class DetailNasabahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailNasabahViewModel>(
      () => DetailNasabahViewModel(),
    );
  }
}
