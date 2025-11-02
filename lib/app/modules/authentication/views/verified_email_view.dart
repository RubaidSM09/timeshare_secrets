import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/home/views/home_view.dart';
import 'package:timeshare_secrets/app/modules/set_profile_docs/views/set_profile_docs_view.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_fonts.dart';
import '../../../../common/widgets/custom_button.dart';

class VerifiedEmailView extends GetView {
  const VerifiedEmailView({super.key});
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
                  'assets/images/onboarding/timeshare_secrets_logo_horizontal.svg',
                ),

                SizedBox(height: 61.h),

                SvgPicture.asset(
                  'assets/images/authentication/verified_email.svg',
                ),

                SizedBox(height: 24.h),

                Text(
                  'Verified Email !',
                  style: h2.copyWith(color: AppColors.tsWhite, fontSize: 36.sp),
                ),

                SizedBox(height: 10.h),

                Text(
                  'Your Account has been created successfully.',
                  style: h4.copyWith(
                    color: AppColors.textColor1,
                    fontSize: 18.sp,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 121.22.h),

                CustomButton(
                  padding: EdgeInsets.all(10.r),
                  color: AppColors.normalYellow,
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
                  onTap: () => Get.offAll(SetProfileDocsView()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
