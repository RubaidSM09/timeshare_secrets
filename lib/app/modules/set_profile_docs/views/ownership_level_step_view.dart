import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:timeshare_secrets/app/modules/set_profile_docs/controllers/set_profile_docs_controller.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';

import 'developer_companies_step_view.dart';

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

    final RxList<String> selectedLevel = <String>[].obs;

    Widget buildLevelTile(String label) {
      return Obx(() {
        final bool isSelected = selectedLevel.contains(label);
        return GestureDetector(
          onTap: () {
            if (isSelected) {
              selectedLevel.remove(label);
            } else {
              selectedLevel.add(label);
            }
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color:
              isSelected ? AppColors.containerColor1 : AppColors.tsWhite,
              border: Border.all(
                color: AppColors.textColor1,
                width: 0.85.r,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.textColor1,
                      width: 1.5.r,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(2.835.r),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? AppColors.textColor1 : AppColors.tsTransparent,
                        border: Border.all(
                          color: AppColors.textColor1,
                          width: 1.r,
                        )
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    label,
                    style: h4.copyWith(
                      color: AppColors.textColor6,
                      fontSize: 16.sp,
                      height: 1.5.h,
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
                      fontSize: 20.sp,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Center(
                    child: Text(
                      'Select all that apply',
                      style: h4.copyWith(
                        color: AppColors.textColor21,
                        fontSize: 12.sp,
                        height: 2.h,
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // Levels list
                  Column(
                    spacing: 12.h,
                    children: levelOptions.map(buildLevelTile).toList(),
                  ),

                  SizedBox(height: 18.h),

                  // Add Level Name button
                  CustomButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 10.h,
                    ),
                    color: AppColors.textColor1,
                    buttonContent: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.normalBlue,
                          size: 24.r,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Add Level Name',
                          style: h4.copyWith(
                            color: AppColors.normalBlue,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.dialog(AddTimeshareCompany(title: 'Add Level Name',));
                    },
                  ),

                  SizedBox(height: 40.h),

                  // Back / Next row
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: controller.goBack,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
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
                                  fontSize: 18.sp,
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
                            vertical: 10.h,
                          ),
                          color: AppColors.textColor1,
                          buttonContent: Center(
                            child: Text(
                              'Next',
                              style: h2.copyWith(
                                color: AppColors.normalBlue,
                                fontSize: 18.sp,
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
