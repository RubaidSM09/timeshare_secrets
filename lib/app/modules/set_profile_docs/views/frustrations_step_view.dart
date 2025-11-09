import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:timeshare_secrets/app/modules/set_profile_docs/controllers/set_profile_docs_controller.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';

class FrustrationsStepView extends GetView<SetProfileDocsController> {
  const FrustrationsStepView({super.key});

  @override
  Widget build(BuildContext context) {
    final RxList<String> options = <String>[
      'Understanding my contract',
      'Maintenance fees',
      'Booking rules',
      'Exchange / trading',
      'Resale / exit concerns',
    ].obs;

    final RxString selectedOption = ''.obs;

    Widget buildOptionTile(String label) {
      return Obx(() {
        final bool isSelected = selectedOption.value == label;
        return GestureDetector(
          onTap: () => selectedOption.value = label,
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
                    'What frustrates you most about your ownership right now?',
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

                  // Options list
                  Column(
                    spacing: 12.h,
                    children: options.map(buildOptionTile).toList(),
                  ),

                  SizedBox(height: 18.h),

                  // Add Option button
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
                          'Add  Option',
                          style: h2.copyWith(
                            color: AppColors.normalBlue,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      // TODO: open dialog to add custom frustration option
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
