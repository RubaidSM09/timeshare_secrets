import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';

import '../../../../common/app_colors.dart';
import '../controllers/onboarding_controller.dart';
import 'onboarding1_view.dart';
import 'onboarding2_view.dart';
import 'onboarding3_view.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 20.h,
              left: 0.w,
              right: 0.w,
              child: SvgPicture.asset(
                'assets/images/onboarding/timeshare_secrets_logo_horizontal.svg'
              ),
            ),

            Obx(()
              => controller.current.value != 2 ? Positioned(
                top: 97.h,
                right: 20.65.w,
                child: Container(
                  padding: EdgeInsets.only(left: 14.w, right: 10.w, top: 6.h, bottom: 6.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(
                      color: AppColors.tsWhite,
                      width: 0.5.r,
                    ),
                  ),
                  child: Row(
                    spacing: 10.w,
                    children: [
                      Text(
                        'Skip',
                        style: h4.copyWith(
                          color: AppColors.textColor1,
                          fontSize: 12.sp,
                        ),
                      ),

                      Icon(
                        Icons.arrow_forward_outlined,
                        color: AppColors.textColor1,
                        size: 15.34.r,
                      )
                    ],
                  ),
                ),
              ) : SizedBox.shrink(),
            ),

            Center(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                children: const [
                  Onboarding1View(),
                  Onboarding2View(),
                  Onboarding3View(),
                ],
              ),
            ),

            Positioned(
              bottom: 44.h,
              left: 31.w,
              right: 31.w,
              child: GestureDetector(
                onTap: () => controller.next(),
                child: Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: AppColors.textColor1,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox.shrink(),

                      Obx(() {
                        return Text(
                          controller.current.value != 2 ? 'Next' : 'Sign Up For  Free',
                          style: h2.copyWith(
                            color: AppColors.normalBlue,
                            fontSize: 18.sp,
                          ),
                        );
                      }),

                      SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
