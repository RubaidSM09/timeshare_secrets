import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';

class Onboarding3View extends GetView {
  const Onboarding3View({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0.h,
          right: 0.w,
          child: Image.asset(
            'assets/images/onboarding/forever_free_sign_up_top_right.png',
            scale: 4,
          ),
        ),

        Positioned(
          bottom: 0.h,
          left: 0.w,
          child: Image.asset(
            'assets/images/onboarding/forever_free_sign_up_bottom_left.png',
            scale: 4,
          ),
        ),

        Positioned(
          top: 461.57.h,
          left: 20.w,
          child: SvgPicture.asset(
            'assets/images/onboarding/forever_free_sign_up.svg',
          ),
        ),

        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 79.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forever',
                  style: h2.copyWith(
                    color: AppColors.textColor1,
                    fontSize: 40.sp,
                  ),
                ),

                Text(
                  'Free Sign Up',
                  style: h2.copyWith(
                    color: AppColors.tsWhite,
                    fontSize: 28.sp,
                  ),
                ),

                SizedBox(height: 4.h,),

                Text(
                  'Enjoy free access to our features forever. Upgrade anytime to unlock unlimited benefits.',
                  style: h4.copyWith(
                    color: AppColors.textColor1,
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
