import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/authentication/views/sign_in_view.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_fonts.dart';
import '../../../../common/widgets/custom_button.dart';

class PasswordChangedView extends GetView {
  const PasswordChangedView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 53.h),

                SvgPicture.asset(
                  'assets/images/authentication/timeshare_logo.svg',
                ),

                SizedBox(height: 81.37.h),

                SvgPicture.asset(
                  'assets/images/authentication/verified_email.svg',
                ),

                SizedBox(height: 24.h),

                Text(
                  'Password Change!',
                  style: h2.copyWith(color: AppColors.tsWhite, fontSize: 36.sp),
                ),

                SizedBox(height: 12.h),

                Text(
                  'Your password has been changed successfully.',
                  style: h4.copyWith(
                    color: AppColors.borderColor1,
                    fontSize: 18.sp,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 121.22.h),

                CustomButton(
                  padding: EdgeInsets.all(10.r),
                  color: AppColors.textColor1,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.tsBlack.withAlpha(26),
                      blurRadius: 42.4.r,
                      offset: Offset(0.w, 4.h),
                    )
                  ],
                  buttonContent: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue',
                        style: h2.copyWith(
                          color: AppColors.normalBlue,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Get.offAll(SignInView()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
