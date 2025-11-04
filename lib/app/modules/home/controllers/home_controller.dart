import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<RxBool> isDeleteClicked = [false.obs, false.obs, false.obs].obs;

  void DeleteClicked (int index) {
    for (int i=0; i<isDeleteClicked.length; i++) {
      if (i == index && isDeleteClicked[i] == false.obs) {
        isDeleteClicked[i] = true.obs;
      } else {
        isDeleteClicked[i] = false.obs;
      }
    }
  }

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
