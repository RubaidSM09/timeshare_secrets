import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/profile/controllers/profile_controller.dart';
import 'package:timeshare_secrets/app/modules/profile/views/settings_view.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_fonts.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_text_fields.dart';

class ChangePasswordView extends GetView<ProfileController> {
  const ChangePasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SettingsAppBar(appBarText: 'Change Password',),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 32.h,),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 26.w,
                    vertical: 26.h,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.containerColor1.withAlpha(38),
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: AppColors.textColor1,
                      )
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Current Password',
                            style: h4.copyWith(
                              color: AppColors.textColor1,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 4.h,),

                      Obx(() {
                        return CustomTextFields(
                          hintText: 'Enter Current Password',
                          color: AppColors.containerColor1,
                          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 11.h,),
                          hintTextColor: AppColors.textColor12,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.tsBlack.withAlpha(64),
                              blurRadius: 2.r,
                            ),
                          ],
                          typedTextColor: AppColors.textColor12,
                          suffixIcon: controller.isCurrentPasswordVisible.value
                              ? 'assets/images/authentication/invisible.png'
                              : 'assets/images/authentication/visible.png',
                          isObscureText: controller.isCurrentPasswordVisible,
                        );
                      }),

                      SizedBox(height: 8.h,),

                      Row(
                        children: [
                          Text(
                            'New Password',
                            style: h4.copyWith(
                              color: AppColors.textColor1,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 4.h,),

                      Obx(() {
                        return CustomTextFields(
                          hintText: 'Enter New Password',
                          color: AppColors.containerColor1,
                          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 11.h,),
                          hintTextColor: AppColors.textColor12,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.tsBlack.withAlpha(64),
                              blurRadius: 2.r,
                            ),
                          ],
                          typedTextColor: AppColors.textColor12,
                          suffixIcon: controller.isNewPasswordVisible.value
                              ? 'assets/images/authentication/invisible.png'
                              : 'assets/images/authentication/visible.png',
                          isObscureText: controller.isNewPasswordVisible,
                        );
                      }),

                      SizedBox(height: 8.h,),

                      Row(
                        children: [
                          Text(
                            'Confirm Password',
                            style: h4.copyWith(
                              color: AppColors.textColor1,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 4.h,),

                      Obx(() {
                        return CustomTextFields(
                          hintText: 'Re-inter New Password',
                          color: AppColors.containerColor1,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w, vertical: 11.h,),
                          hintTextColor: AppColors.textColor12,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.tsBlack.withAlpha(64),
                              blurRadius: 2.r,
                            ),
                          ],
                          typedTextColor: AppColors.textColor12,
                          suffixIcon: controller.isConfirmPasswordVisible.value
                              ? 'assets/images/authentication/invisible.png'
                              : 'assets/images/authentication/visible.png',
                          isObscureText: controller.isConfirmPasswordVisible,
                        );
                      }),
                    ],
                  ),
                ),

                SizedBox(height: 30.h,),

                CustomButton(
                  padding: EdgeInsets.all(10.r),
                  color: AppColors.textColor1,
                  buttonContent: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Update Password',
                        style: h2.copyWith(
                          color: AppColors.tsWhite,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {  },
                ),

                SizedBox(height: 12.h,),

                Text(
                  'Make sure your new password is at least 8 characters long.',
                  style: h4.copyWith(
                    color: AppColors.textColor1,
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
