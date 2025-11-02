import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/authentication/views/authentication_view.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';
import 'package:timeshare_secrets/common/widgets/custom_text_fields.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_fonts.dart';
import '../controllers/authentication_controller.dart';
import 'forgot_password_view.dart';

class SignInView extends GetView<AuthenticationController> {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AuthenticationController());

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
                  'Welcome back',
                  style: h2.copyWith(
                    color: AppColors.tsWhite,
                    fontSize: 24.sp,
                  ),
                ),

                SizedBox(height: 24.h,),

                CustomTextFields(
                  hintText: 'abc@email.com',
                  prefixIcon: 'assets/images/authentication/mail.png',
                  isObscureText: false.obs,
                ),

                SizedBox(height: 20.h,),

                Obx(() {
                  return CustomTextFields(
                    hintText: 'Enter you password',
                    prefixIcon: 'assets/images/authentication/password.png',
                    suffixIcon: controller.isSignInPasswordVisible.value
                        ? 'assets/images/authentication/invisible.png'
                        : 'assets/images/authentication/visible.png',
                    isObscureText: controller.isSignInPasswordVisible,
                  );
                }),

                SizedBox(height: 24.h,),

                CustomButton(
                  padding: EdgeInsets.all(10.r),
                  color: AppColors.textColor1,
                  buttonContent: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign In',
                        style: h2.copyWith(
                          color: AppColors.normalBlue,
                          fontSize: 18.sp,
                        ),
                      )
                    ],
                  ),
                  onTap: () {  },
                ),

                SizedBox(height: 30.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 12.w,
                      children: [
                        Obx(() {
                          return GestureDetector(
                            onTap: () {
                              controller.rememberMeController.value = !controller.rememberMeController.value;
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                left: controller.rememberMeController.value ? 15.2.w : 1.9.w,
                                right: controller.rememberMeController.value ? 1.9.w : 15.2.w,
                                top: 1.9.h,
                                bottom: 1.9.h,
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.normalYellow.withAlpha(controller.rememberMeController.value ? 255 : 64),
                                  borderRadius: BorderRadius.circular(95.r)
                              ),
                              child: Container(
                                padding: EdgeInsets.all(7.6.r),
                                decoration: BoxDecoration(
                                    color: AppColors.tsWhite,
                                    shape: BoxShape.circle
                                ),
                              ),
                            ),
                          );
                        }),

                        Text(
                          'Remember Me'.tr,
                          style: h4.copyWith(
                            color: AppColors.textColor1,
                            fontSize: 14.sp,
                          ),
                        )
                      ],
                    ),


                    GestureDetector(
                      onTap: () => Get.to(ForgotPasswordView()),
                      child: Text(
                        'Forgot Password?'.tr,
                        style: h4.copyWith(
                          color: AppColors.normalYellow,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24.h,),

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

                SizedBox(height: 44.h,),

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

                SizedBox(height: 44.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account? ',
                      style: h3.copyWith(
                        color: AppColors.tsWhite,
                        fontSize: 16.sp,
                      ),
                    ),

                    GestureDetector(
                      onTap: () => Get.to(AuthenticationView()),
                      child: Text(
                        'Sign Up',
                        style: h3.copyWith(
                          color: AppColors.textColor1,
                          fontSize: 16.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
