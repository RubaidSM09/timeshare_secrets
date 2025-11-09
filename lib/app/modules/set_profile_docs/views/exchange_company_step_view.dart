import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:timeshare_secrets/app/modules/set_profile_docs/controllers/set_profile_docs_controller.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';

class ExchangeCompanyStepView extends GetView<SetProfileDocsController> {
  const ExchangeCompanyStepView({super.key});

  @override
  Widget build(BuildContext context) {
    final RxList<String> companies = <String>[
      'RCI',
      'Destination Exchange',
      'Interval International)',
      'Not Sure',
    ].obs;

    final RxString selectedCompany = ''.obs;

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
                    'Exchange Company Name',
                    style: h2.copyWith(
                      color: AppColors.normalBlue,
                      fontSize: 22.sp,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Search row
                  Row(
                    children: [
                      // Search company name
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.tsWhite,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: AppColors.containerColor8,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: AppColors.tsGray,
                                size: 18.r,
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Text(
                                  'Search company name',
                                  style: h4.copyWith(
                                    color: AppColors.tsGray,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 10.w),

                      // List of company dropdown
                      Container(
                        width: 150.w,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.tsWhite,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: AppColors.containerColor8,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.list_alt_rounded,
                              color: AppColors.tsGray,
                              size: 18.r,
                            ),
                            Expanded(
                              child: Text(
                                'List of company',
                                style: h4.copyWith(
                                  color: AppColors.tsGray,
                                  fontSize: 13.sp,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.tsGray,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  // Companies list
                  Obx(() {
                    return Column(
                      spacing: 12.h,
                      children: companies.map((c) {
                        final bool isSelected = selectedCompany.value == c;
                        return GestureDetector(
                          onTap: () => selectedCompany.value = c,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 14.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: isSelected
                                  ? AppColors.containerColor1
                                  : AppColors.tsWhite,
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
                                    c,
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
                      }).toList(),
                    );
                  }),

                  SizedBox(height: 18.h),

                  // Add Exchange Company button
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
                          'Add Exchange Company',
                          style: h2.copyWith(
                            color: AppColors.normalBlue,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      // TODO: open dialog to add another exchange company
                    },
                  ),

                  const SpacerWidget(),

                  // Back / Next buttons row
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

/// Simple flexible spacer that still works inside a Column with minHeight
class SpacerWidget extends StatelessWidget {
  const SpacerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 40.h);
  }
}
