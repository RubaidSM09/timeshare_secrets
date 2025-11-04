import 'package:get/get.dart';

import '../controllers/genie_controller.dart';

class GenieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenieController>(
      () => GenieController(),
    );
  }
}
