import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/authentication/views/otp_verifications_view.dart';
import 'package:timeshare_secrets/common/widgets/custom_text_fields.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_fonts.dart';
import '../../../../common/widgets/custom_button.dart';

class ForgotPasswordView extends GetView {
  const ForgotPasswordView({super.key});
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

                SizedBox(height: 101.37.h),

                Text(
                  'Forgot password?',
                  style: h2.copyWith(
                    color: AppColors.tsWhite,
                    fontSize: 36.sp,
                    shadows: [
                      Shadow(
                        color: AppColors.tsBlack.withAlpha(26),
                        blurRadius: 42.4.r,
                        offset: Offset(0.w, 4.h),
                      )
                    ]
                  ),
                ),

                SizedBox(height: 20.h),

                Text(
                  'Don\'t worry! Please enter the email address linked with your account.',
                  style: h4.copyWith(
                    color: AppColors.borderColor1,
                    fontSize: 18.sp,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 24.h),

                CustomTextFields(
                  hintText: 'abc@email.com',
                  prefixIcon: 'assets/images/authentication/mail.png',
                  isObscureText: false.obs,
                ),

                SizedBox(height: 30.h),

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
                        'Send',
                        style: h2.copyWith(
                          color: AppColors.normalBlue,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Get.to(OtpVerificationsView()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
