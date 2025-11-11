import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:timeshare_secrets/app/modules/authentication/views/password_changed_view.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_fonts.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_text_fields.dart';

class CreateNewPasswordView extends GetView<AuthenticationController> {
  const CreateNewPasswordView({super.key});
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
                SizedBox(height: 53.h),

                SvgPicture.asset(
                  'assets/images/authentication/timeshare_logo.svg',
                ),

                SizedBox(height: 101.37.h),

                Text(
                  'Create new password',
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
                  'Your new password must be unique from those previously used.',
                  style: h4.copyWith(
                    color: AppColors.borderColor1,
                    fontSize: 18.sp,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 24.h),

                Obx(() {
                  return CustomTextFields(
                    hintText: 'New password',
                    prefixIcon: 'assets/images/authentication/password.png',
                    suffixIcon: controller.isNewPasswordVisible.value
                        ? 'assets/images/authentication/invisible.png'
                        : 'assets/images/authentication/visible.png',
                    isObscureText: controller.isNewPasswordVisible,
                  );
                }),

                SizedBox(height: 20.h,),

                Obx(() {
                  return CustomTextFields(
                    hintText: 'Confirm password',
                    prefixIcon: 'assets/images/authentication/password.png',
                    suffixIcon: controller.isConfirmNewPasswordVisible.value
                        ? 'assets/images/authentication/invisible.png'
                        : 'assets/images/authentication/visible.png',
                    isObscureText: controller.isConfirmNewPasswordVisible,
                  );
                }),

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
                        'Save',
                        style: h2.copyWith(
                          color: AppColors.normalBlue,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Get.to(PasswordChangedView()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
