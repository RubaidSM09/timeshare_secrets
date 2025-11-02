import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/authentication/views/authentication_view.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  final current = 0.obs;

  void onPageChanged(int i) => current.value = i;

  void skip() => Get.offAllNamed('/home');

  void next() {
    if (current.value < 2) {
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      Get.offAll(AuthenticationView());
    }
  }

  // void openSignIn() => Get.toNamed('/sign-in');
  // void openSignUp() => Get.toNamed('/sign-up');

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
