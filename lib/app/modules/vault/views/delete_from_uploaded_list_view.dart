import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';

class DeleteFromUploadedListView extends GetView {
  const DeleteFromUploadedListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.tsWhite,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 51.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Delete from uploaded list',
                  style: h1.copyWith(
                    color: AppColors.textColor12,
                    fontSize: 20.sp,
                  ),
                ),

                SizedBox(height: 16.h,),

                Text(
                  'Are you sure you want to Delete this file?',
                  style: h4.copyWith(
                    color: AppColors.textColor13,
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 30.h,),

                Row(
                  spacing: 17.w,
                  children: [
                    Expanded(
                      child: CustomButton(
                        padding: EdgeInsets.all(10.r),
                        color: AppColors.tsTransparent,
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
                            'Delete',
                            style: h1.copyWith(
                              color: AppColors.tsWhite,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        onTap: () {  },
                      ),
                    ),
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
