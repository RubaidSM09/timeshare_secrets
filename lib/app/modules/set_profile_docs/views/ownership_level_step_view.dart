import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:timeshare_secrets/app/modules/set_profile_docs/controllers/set_profile_docs_controller.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';

class OwnershipLevelStepView extends GetView<SetProfileDocsController> {
  const OwnershipLevelStepView({super.key});

  @override
  Widget build(BuildContext context) {
    final RxList<String> levelOptions = <String>[
      'Member',
      'Preferred',
      'Preferred Plus',
      'Premier',
      'Premier Plus',
      'Centum Plus',
      'Not Sure',
    ].obs;

    final RxString selectedLevel = ''.obs;

    Widget buildLevelTile(String label) {
      return Obx(() {
        final bool isSelected = selectedLevel.value == label;
        return GestureDetector(
          onTap: () => selectedLevel.value = label,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color:
              isSelected ? AppColors.containerColor1 : AppColors.tsWhite,
              border: Border.all(
                color: AppColors.containerColor8,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.radio_button_checked,
                  color: AppColors.containerColor8,
                  size: 18.r,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    label,
                    style: h4.copyWith(
                      color: AppColors.normalBlue,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    'Which best describes your\n[Developer] ownership level ?',
                    style: h2.copyWith(
                      color: AppColors.normalBlue,
                      fontSize: 22.sp,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    'Select all that apply',
                    style: h4.copyWith(
                      color: AppColors.tsGray,
                      fontSize: 14.sp,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Levels list
                  Column(
                    spacing: 12.h,
                    children: levelOptions.map(buildLevelTile).toList(),
                  ),

                  SizedBox(height: 18.h),

                  // Add Level Name button
                  CustomButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 10.h,
                    ),
                    color: AppColors.containerColor8,
                    buttonContent: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.normalBlue,
                          size: 18.r,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          'Add Level Name',
                          style: h2.copyWith(
                            color: AppColors.normalBlue,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      // TODO: open dialog to add new level name
                    },
                  ),

                  SizedBox(height: 32.h),

                  // Back / Next row
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: controller.goBack,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.tsWhite,
                              border: Border.all(
                                color: AppColors.normalBlue,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Back',
                                style: h2.copyWith(
                                  color: AppColors.normalBlue,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: CustomButton(
                          padding: EdgeInsets.symmetric(
                            vertical: 12.h,
                          ),
                          color: AppColors.textColor1,
                          buttonContent: Center(
                            child: Text(
                              'Next',
                              style: h2.copyWith(
                                color: AppColors.normalBlue,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          onTap: controller.goNext,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
