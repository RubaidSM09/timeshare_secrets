import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:timeshare_secrets/app/modules/authentication/views/verified_email_view.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';
import 'package:timeshare_secrets/common/widgets/otp_field/otp_field.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_fonts.dart';
import '../../../../common/widgets/otp_field/otp_controller.dart';

class VerifyMailView extends GetView<AuthenticationController> {
  const VerifyMailView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AuthenticationController());

    final otpController = Get.put(OtpController(otpLength: 6));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 53.h,),

                SvgPicture.asset(
                    'assets/images/onboarding/timeshare_secrets_logo_horizontal.svg'
                ),

                SizedBox(height: 53.22.h,),

                Text(
                  'Verify Your Email',
                  style: h2.copyWith(
                    color: AppColors.tsWhite,
                    fontSize: 24.sp,
                  ),
                ),

                SizedBox(height: 24.h,),

                OtpField(),

                SizedBox(height: 16.h,),

                Row(
                  children: [
                    Text(
                      'Tip : Make sure check your inbox and spam folders',
                      style: h4.copyWith(
                        color: AppColors.textColor1,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 262.h,),

                CustomButton(
                  padding: EdgeInsets.all(10.r),
                  color: AppColors.normalYellow,
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
                  onTap: () => Get.to(VerifiedEmailView()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
