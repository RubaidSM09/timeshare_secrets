import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  final RxBool isSignInPasswordVisible = true.obs;
  final RxBool isSignUpPasswordVisible = true.obs;
  final RxBool isSignUpConfirmPasswordVisible = true.obs;
  final RxBool isNewPasswordVisible = true.obs;
  final RxBool isConfirmNewPasswordVisible = true.obs;

  final RxBool rememberMeController = true.obs;
  final RxBool tppCheckboxController = true.obs;

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
