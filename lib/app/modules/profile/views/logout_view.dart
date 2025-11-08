import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/authentication/views/authentication_view.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';

class LogoutView extends GetView {
  const LogoutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.tsWhite,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 51.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Log Out',
              style: h1.copyWith(
                color: AppColors.textColor12,
                fontSize: 20.sp,
              ),
            ),

            SizedBox(height: 16.h,),

            Text(
              'Are you sure you want to log out?',
              style: h4.copyWith(
                color: AppColors.textColor13,
                fontSize: 16.sp,
              ),
            ),

            SizedBox(height: 30.h,),

            Row(
              spacing: 17.w,
              children: [
                Expanded(
                  child: CustomButton(
                    padding: EdgeInsets.all(10.r),
                    border: Border.all(
                      color: AppColors.borderColor3,
                    ),
                    buttonContent: Center(
                      child: Text(
                        'Cancel',
                        style: h1.copyWith(
                          color: AppColors.textColor12,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    onTap: () => Get.back(),
                  ),
                ),

                Expanded(
                  child: CustomButton(
                    padding: EdgeInsets.all(10.r),
                    color: AppColors.textColor13,
                    buttonContent: Center(
                      child: Text(
                        'Log Out',
                        style: h1.copyWith(
                          color: AppColors.tsWhite,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    onTap: () => Get.offAll(AuthenticationView()),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
