import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/authentication/views/create_new_password_view.dart';
import 'package:timeshare_secrets/common/widgets/otp_field/otp_field.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_fonts.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/otp_field/otp_controller.dart';

class OtpVerificationsView extends GetView {
  const OtpVerificationsView({super.key});
  @override
  Widget build(BuildContext context) {
    final otpController = Get.put(OtpController(otpLength: 4));

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

                SizedBox(height: 101.37.h),

                Text(
                  'OTP verifications',
                  style: h2.copyWith(
                      color: AppColors.tsWhite,
                      fontSize: 36.sp,
                  ),
                ),

                SizedBox(height: 20.h),

                Text(
                  'Enter the verification code we just sent on your email address.',
                  style: h4.copyWith(
                    color: AppColors.borderColor1,
                    fontSize: 18.sp,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 24.h),

                OtpField(
                  boxWidth: 65.w,
                  spacing: 22.w,
                ),

                SizedBox(height: 30.15.h),

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
                        'Verify',
                        style: h2.copyWith(
                          color: AppColors.normalBlue,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Get.to(CreateNewPasswordView()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
