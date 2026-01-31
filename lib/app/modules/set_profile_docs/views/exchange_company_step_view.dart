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

    final RxList<String> selectedCompany = <String>[].obs;

    final RxBool companyListOpen = false.obs;

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

                  SizedBox(height: 12.h),

                  // Search row
                  Row(
                    spacing: 24.w,
                    children: [
                      // Search box
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.tsWhite,
                            border: Border.all(color: AppColors.textColor1,),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.tsBlack.withAlpha(38),
                                blurRadius: 6.r,
                                offset: Offset(1.w, 1.h),
                              )
                            ],
                          ),
                          child: Row(
                            spacing: 4.w,
                            children: [
                              Icon(
                                Icons.search,
                                color: AppColors.textColor22,
                                size: 18.r,
                              ),

                              Expanded(
                                child: Text(
                                  'Search company name',
                                  style: h4.copyWith(
                                    color: AppColors.textColor22,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Custom dropdown box (not built in)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            companyListOpen.value = !companyListOpen.value;
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.tsWhite,
                              border: Border.all(color: AppColors.textColor1,),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.tsBlack.withAlpha(38),
                                  blurRadius: 6.r,
                                  offset: Offset(1.w, 1.h),
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.list,
                                  color: AppColors.textColor10,
                                  size: 18.r,
                                ),

                                SizedBox(width: 4.w),

                                Expanded(
                                  child: Text(
                                    'List of company',
                                    style: h4.copyWith(
                                      color: AppColors.textColor22,
                                      fontSize: 10.sp,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                Obx(() => Transform.rotate(
                                  angle: companyListOpen.value ? 3.1416 : 0,
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: AppColors.tsGray,
                                    size: 18.r,
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  // Companies list
                  Obx(() {
                    return Column(
                      spacing: 12.h,
                      children: companies.map((c) {
                        final bool isSelected = selectedCompany.contains(c);
                        return GestureDetector(
                          onTap: () {
                            if (isSelected) {
                              selectedCompany.remove(c);
                            } else {
                              selectedCompany.add(c);
                            }
                          },
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

                  SizedBox(height: 12.h),

                  // Add Exchange Company button
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
                          'Add Exchange Company',
                          style: h4.copyWith(
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

/// Simple flexible spacer that still works inside a Column with minHeight
class SpacerWidget extends StatelessWidget {
  const SpacerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 40.h);
  }
}
