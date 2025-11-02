import 'package:get/get.dart';

import '../controllers/set_profile_docs_controller.dart';

class SetProfileDocsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetProfileDocsController>(
      () => SetProfileDocsController(),
    );
  }
}
