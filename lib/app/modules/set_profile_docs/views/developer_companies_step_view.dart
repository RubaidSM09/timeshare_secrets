// lib/app/modules/set_profile_docs/views/developer_companies_step_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/set_profile_docs/controllers/set_profile_docs_controller.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';
import 'package:timeshare_secrets/common/widgets/custom_text_fields.dart';

class DeveloperCompaniesStepView extends GetView<SetProfileDocsController> {
  const DeveloperCompaniesStepView({super.key});

  @override
  Widget build(BuildContext context) {
    // sample company list
    final RxList<String> companies = <String>[
      'Hilton Grand Vacations',
      'Marriott Vacations Worldwide',
      'Wyndham Destinations',
      'Disney Vacation Club',
      'Not Sure',
      'RCI',
      'Destination Exchange',
      'Interval International'
    ].obs;

    // selected companies
    final RxList<String> selectedCompanies = <String>[].obs;

    // dropdown open state
    final RxBool companyListOpen = false.obs;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'Which timeshare developer(s)\ndo you own with?',
                  style: h2.copyWith(
                    color: AppColors.normalBlue,
                    fontSize: 20.sp,
                  ),
                ),

                SizedBox(height: 10.h),

                // Subtitle
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Select all that apply',
                      style: h4.copyWith(
                        color: AppColors.textColor21,
                        fontSize: 12.sp,
                        height: 2.h,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                // Search fields row
                Row(
                  spacing: 24.w,
                  children: [
                    // Search box
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 10.h),
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
                              child: TextField(
                                style: h4.copyWith(
                                  color: AppColors.textColor6, // typed text color (keep readable)
                                  fontSize: 10.sp,
                                ),
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                  hintText: 'Search company name',
                                  hintStyle: h4.copyWith(
                                    color: AppColors.textColor22,
                                    fontSize: 10.sp,
                                    height: 2.4.h,
                                  ),
                                  contentPadding: EdgeInsets.zero,
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
                              horizontal: 12.w, vertical: 10.h),
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
                                    height: 2.4.h,
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

                SizedBox(height: 18.h),

                // Dropdown container (custom)
                Obx(() {
                  if (!companyListOpen.value) return const SizedBox.shrink();

                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 21.h),
                    decoration: BoxDecoration(
                      color: AppColors.tsWhite,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColors.textColor1,),
                    ),
                    // fixed height with scroll
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 778.h,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          spacing: 12.h,
                          children: companies.map((company) {
                            final bool isSelected = selectedCompanies.contains(company);
                            return GestureDetector(
                              onTap: () {
                                if (isSelected) {
                                  selectedCompanies.remove(company);
                                } else {
                                  selectedCompanies.add(company);
                                }
                                // optionally close dropdown after selection:
                                // companyListOpen.value = false;
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: isSelected ? AppColors.containerColor1 : AppColors.tsWhite,
                                  border: Border.all(color: AppColors.containerColor8),
                                ),
                                child: Row(
                                  spacing: 4.w,
                                  children: [
                                    // circular radio-like icon
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

                                    Expanded(
                                      child: Text(
                                        company,
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
                          }).toList(),
                        ),
                      ),
                    ),
                  );
                }),

                SizedBox(height: 18.h),

                // If dropdown is closed show the compact list items (regular layout)
                Obx(() {
                  if (companyListOpen.value) {
                    // when dropdown open we don't show the compact list below
                    return const SizedBox.shrink();
                  }
                  // Show first N companies as in original compact layout
                  final compactList = companies.take(5).toList();
                  return Column(
                    spacing: 12.h,
                    children: compactList.map((company) {
                      final bool isSelected = selectedCompanies.contains(company);
                      return GestureDetector(
                        onTap: () {
                          if (isSelected) selectedCompanies.remove(company);
                          else selectedCompanies.add(company);
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: isSelected ? AppColors.containerColor1 : AppColors.tsTransparent,
                            border: Border.all(
                              color: AppColors.textColor1,
                              width: 0.85.r,
                            ),
                          ),
                          child: Row(
                            spacing: 4.w,
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

                              Expanded(
                                child: Text(
                                  company,
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
                    }).toList(),
                  );
                }),

                SizedBox(height: 12.h),

                // Add Timeshare Company Button
                CustomButton(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                  color: AppColors.textColor1,
                  buttonContent: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 4.w,
                    children: [
                      Icon(
                        Icons.add,
                        color: AppColors.normalBlue,
                        size: 24.r,
                      ),

                      Text(
                        'Add Timeshare Company',
                        style: h4.copyWith(
                          color: AppColors.normalBlue,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Get.dialog(AddTimeshareCompany(title: 'Add Timeshare Company',));
                  },
                ),

                SizedBox(height: 40.h),

                // Next Button aligned to right
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      padding: EdgeInsets.symmetric(horizontal: 75.w, vertical: 10.h,),
                      color: AppColors.textColor1,
                      buttonContent: Center(
                        child: Text(
                          'Next',
                          style: h2.copyWith(color: AppColors.normalBlue, fontSize: 16.sp),
                        ),
                      ),
                      onTap: () {
                        controller.goNext();
                      },
                    ),
                  ],
                ),

                SizedBox(height: 24.h),
              ],
            ),
          ),
        );
      },
    );
  }
}


class AddTimeshareCompany extends StatelessWidget {
  final String title;

  const AddTimeshareCompany({
    required this.title,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      backgroundColor: AppColors.tsWhite,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: h1.copyWith(
                color: AppColors.textColor12,
                fontSize: 24.sp,
              ),
            ),

            SizedBox(height: 16.h,),

            CustomTextFields(
              width: double.infinity,
              hintText: 'Enter company name',
              hintTextColor: AppColors.textColor22,
              borderColor: AppColors.textColor1,
              borderRadius: 6.r,
              color: AppColors.tsWhite,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h,),
              prefixIcon: 'assets/images/set_profile_docs/company_name.png',
              boxShadow: [
                BoxShadow(
                  color: AppColors.tsBlack.withAlpha(38),
                  blurRadius: 6.r,
                  offset: Offset(1.w, 1.h,),
                )
              ],
              isObscureText: false.obs,
            ),

            SizedBox(height: 16.h,),

            CustomTextFields(
              width: double.infinity,
              hintText: 'Enter company official email',
              hintTextColor: AppColors.textColor22,
              borderColor: AppColors.textColor1,
              borderRadius: 6.r,
              color: AppColors.tsWhite,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h,),
              prefixIcon: 'assets/images/set_profile_docs/company_official_mail.png',
              boxShadow: [
                BoxShadow(
                  color: AppColors.tsBlack.withAlpha(38),
                  blurRadius: 6.r,
                  offset: Offset(1.w, 1.h,),
                )
              ],
              isObscureText: false.obs,
            ),

            SizedBox(height: 24.h,),

            Row(
              spacing: 17.w,
              children: [
                Expanded(
                  child: CustomButton(
                    padding: EdgeInsets.all(10.r),
                    border: Border.all(
                      color: AppColors.textColor13,
                    ),
                    buttonContent: Center(
                      child: Text(
                        'Cancel',
                        style: h1.copyWith(
                          color: AppColors.textColor13,
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
                    color: AppColors.textColor1,
                    buttonContent: Center(
                      child: Text(
                        'Add',
                        style: h1.copyWith(
                          color: AppColors.normalBlue,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    onTap: () => Get.back(),
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
