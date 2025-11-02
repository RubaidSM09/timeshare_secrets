import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/authentication/views/create_account_view.dart';
import 'package:timeshare_secrets/app/modules/authentication/views/sign_in_view.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.5.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 53.h,),

                SvgPicture.asset(
                  'assets/images/onboarding/timeshare_secrets_logo_horizontal.svg'
                ),

                SizedBox(height: 50.h,),

                Text(
                  'Welcome to Timeshare',
                  style: h2.copyWith(
                    color: AppColors.tsWhite,
                    fontSize: 24.sp,
                  ),
                ),

                Text(
                  'Unlock the full power of your ownership.',
                  style: h4.copyWith(
                    color: AppColors.textColor1,
                    fontSize: 16.sp,
                  ),
                ),

                SizedBox(height: 10.h,),

                Text(
                  'Joined by thousands of elite owners who trust us to maximize their timeshare investment value.',
                  style: h4.copyWith(
                    color: AppColors.textColor3,
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 60.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 12.h),
                  color: AppColors.tsWhite.withAlpha(26),
                  border: Border.all(
                    color: AppColors.tsWhite,
                    width: 0.5.r,
                  ),
                  buttonContent: Row(
                    spacing: 16.w,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/authentication/apple.svg',
                      ),

                      Text(
                        'Continue with Apple',
                        style: h2.copyWith(
                          color: AppColors.tsWhite,
                          fontSize: 16.sp,
                        ),
                      )
                    ],
                  ),
                  onTap: () {  },
                ),

                SizedBox(height: 16.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 12.h),
                  color: AppColors.tsWhite.withAlpha(26),
                  border: Border.all(
                    color: AppColors.tsWhite,
                    width: 0.5.r,
                  ),
                  buttonContent: Row(
                    spacing: 16.w,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/authentication/google.svg',
                      ),

                      Text(
                        'Continue with Google',
                        style: h2.copyWith(
                          color: AppColors.tsWhite,
                          fontSize: 16.sp,
                        ),
                      )
                    ],
                  ),
                  onTap: () {  },
                ),

                SizedBox(height: 28.h,),

                Row(
                  spacing: 22.w,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 51.5.w, vertical: 0.5.h),
                      color: AppColors.tsGray,
                    ),

                    Text(
                      'Or',
                      style: h3.copyWith(
                        color: AppColors.tsGray,
                        fontSize: 20.sp,
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 51.5.w, vertical: 0.5.h),
                      color: AppColors.tsGray,
                    ),
                  ],
                ),

                SizedBox(height: 24.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 12.h),
                  color: AppColors.textColor1,
                  border: Border.all(
                    color: AppColors.tsGray,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.tsBlack.withAlpha(64),
                      blurRadius: 6.r,
                      offset: Offset(1.w, 2.h),
                    )
                  ],
                  buttonContent: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Create an Account',
                        style: h2.copyWith(
                          color: AppColors.textColor4,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Get.to(CreateAccountView()),
                ),

                SizedBox(height: 20.h,),

                Text(
                  'By continuing, you agree to ',
                  style: h4.copyWith(
                    color: AppColors.textColor5,
                    fontSize: 14.sp,
                  ),
                ),

                GestureDetector(
                  onTap: () {  },
                  child: Text(
                    'Terms and Privacy Policy.',
                    style: h3.copyWith(
                      color: AppColors.textColor1,
                      fontSize: 14.sp,
                    ),
                  ),
                ),

                SizedBox(height: 124.22.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: h3.copyWith(
                        color: AppColors.tsWhite,
                        fontSize: 16.sp,
                      ),
                    ),

                    GestureDetector(
                      onTap: () => Get.to(SignInView()),
                      child: Text(
                        'Sign In',
                        style: h3.copyWith(
                          color: AppColors.textColor1,
                          fontSize: 16.sp,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
