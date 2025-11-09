import 'package:get/get.dart';

class GenieController extends GetxController {
  RxBool isMessageClicked = false.obs;
  RxBool isVoiceClicked = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
