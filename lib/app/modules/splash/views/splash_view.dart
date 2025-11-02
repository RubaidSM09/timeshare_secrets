import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/common/app_colors.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBgColor1,
      body: SafeArea(
        child: FadeTransition(
          opacity: controller.fade,
          child: Container(
            color: AppColors.normalBlue,
            child: Center(
              child: SvgPicture.asset(
                'assets/images/splash/timeshare_secrets_logo.svg'
              ),
            ),
          ),
        ),
      ),
    );
  }
}
