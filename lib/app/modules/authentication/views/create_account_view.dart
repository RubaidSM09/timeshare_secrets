import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:timeshare_secrets/app/modules/authentication/views/verify_mail_view.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_fonts.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_text_fields.dart';

class CreateAccountView extends GetView<AuthenticationController> {
  const CreateAccountView({super.key});
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
                    'assets/images/authentication/timeshare_logo.svg'
                ),

                SizedBox(height: 53.22.h,),

                Text(
                  'Create An Account',
                  style: h2.copyWith(
                    color: AppColors.tsWhite,
                    fontSize: 24.sp,
                  ),
                ),

                SizedBox(height: 24.h,),

                CustomTextFields(
                  hintText: 'Enter your name',
                  prefixIcon: 'assets/images/authentication/name.png',
                  isObscureText: false.obs,
                ),

                SizedBox(height: 20.h,),

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
                    suffixIcon: controller.isSignUpPasswordVisible.value
                        ? 'assets/images/authentication/invisible.png'
                        : 'assets/images/authentication/visible.png',
                    isObscureText: controller.isSignUpPasswordVisible,
                  );
                }),

                SizedBox(height: 20.h,),

                Obx(() {
                  return CustomTextFields(
                    hintText: 'Confirm password',
                    prefixIcon: 'assets/images/authentication/password.png',
                    suffixIcon: controller.isSignUpConfirmPasswordVisible.value
                        ? 'assets/images/authentication/invisible.png'
                        : 'assets/images/authentication/visible.png',
                    isObscureText: controller.isSignUpConfirmPasswordVisible,
                  );
                }),

                SizedBox(height: 15.h,),

                Row(
                  spacing: 12.w,
                  children: [
                    Obx(() {
                      return GestureDetector(
                        onTap: () {
                          controller.tppCheckboxController.value = !controller.tppCheckboxController.value;
                        },
                        child: Icon(
                          controller.tppCheckboxController.value ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded,
                          color: AppColors.normalYellow,
                          size: 24.r,
                        ),
                      );
                    }),

                    Row(
                      children: [
                        Text(
                          'I agree to '.tr,
                          style: h4.copyWith(
                            color: AppColors.tsWhite,
                            fontSize: 14.sp,
                          ),
                        ),

                        SizedBox(
                          width: 235.w,
                          child: Text(
                            'Terms and Privacy Policy.'.tr,
                            style: h4.copyWith(
                              color: AppColors.normalYellow,
                              fontSize: 14.sp,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                SizedBox(height: 24.h,),

                CustomButton(
                  padding: EdgeInsets.all(10.r),
                  color: AppColors.textColor1,
                  buttonContent: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Create Account',
                        style: h2.copyWith(
                          color: AppColors.normalBlue,
                          fontSize: 18.sp,
                        ),
                      )
                    ],
                  ),
                  onTap: () => Get.to(VerifyMailView()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
