import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:timeshare_secrets/app/modules/set_profile_docs/controllers/set_profile_docs_controller.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';

class DeveloperOwnershipStepView extends GetView<SetProfileDocsController> {
  const DeveloperOwnershipStepView({super.key});

  @override
  Widget build(BuildContext context) {
    final RxList<String> ownershipOptions = <String>[
      'Hilton Club (HC)',
      'Hilton Grand Vacation (HGVC)',
      'Hilton Vacation Club (HVC Trust Points)',
      'Diamond Resorts',
      'Bluegreen',
      'Embarc',
      'Not Sure',
    ].obs;

    final RxString selectedOwnership = ''.obs;

    final RxList<String> seasonOptions = <String>[
      'Platinum',
      'All of the above',
      'Not Sure',
    ].obs;

    final RxString selectedSeason = ''.obs;

    final TextEditingController entity1Controller = TextEditingController();
    final TextEditingController entity2Controller = TextEditingController();
    final TextEditingController sizeController = TextEditingController();
    final TextEditingController unitTypeController = TextEditingController();
    final TextEditingController frequencyController = TextEditingController();
    final TextEditingController pointValueController = TextEditingController();
    final TextEditingController honorsConversionController =
    TextEditingController();

    Widget buildSelectTile({
      required String label,
      required bool selected,
      required VoidCallback onTap,
    }) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: selected ? AppColors.containerColor1 : AppColors.tsWhite,
            border: Border.all(color: AppColors.containerColor8),
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
    }

    InputDecoration buildFieldDecoration(String hint) {
      return InputDecoration(
        hintText: hint,
        hintStyle: h4.copyWith(
          color: AppColors.tsGray,
          fontSize: 13.sp,
        ),
        contentPadding:
        EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.containerColor8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.containerColor8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.normalBlue),
        ),
      );
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
                    'Which best describes your\n[Developer] ownership?',
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

                  // Ownership list
                  Obx(() {
                    return Column(
                      spacing: 12.h,
                      children: ownershipOptions.map((o) {
                        final selected = selectedOwnership.value == o;
                        return buildSelectTile(
                          label: o,
                          selected: selected,
                          onTap: () => selectedOwnership.value = o,
                        );
                      }).toList(),
                    );
                  }),

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
                          'Add Option',
                          style: h2.copyWith(
                            color: AppColors.normalBlue,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      // TODO: show dialog to add option
                    },
                  ),

                  SizedBox(height: 24.h),

                  // Ownership Entity
                  Text(
                    'Ownership Entity',
                    style: h3.copyWith(
                      color: AppColors.normalBlue,
                      fontSize: 15.sp,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  // Entity 1
                  Row(
                    children: [
                      Container(
                        width: 32.w,
                        height: 40.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.containerColor8,
                        ),
                        child: Text(
                          '1',
                          style: h3.copyWith(
                            color: AppColors.normalBlue,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: TextField(
                          controller: entity1Controller,
                          decoration: buildFieldDecoration('Type Here'),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8.h),

                  // Entity 2
                  Row(
                    children: [
                      Container(
                        width: 32.w,
                        height: 40.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.containerColor8,
                        ),
                        child: Text(
                          '2',
                          style: h3.copyWith(
                            color: AppColors.normalBlue,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: TextField(
                          controller: entity2Controller,
                          decoration: buildFieldDecoration('Type Here'),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),

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
                          'Add Another Property',
                          style: h2.copyWith(
                            color: AppColors.normalBlue,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      // TODO: add dynamic property rows if needed
                    },
                  ),

                  SizedBox(height: 24.h),

                  // Choose a Developer option
                  Text(
                    'Choose a Developer option',
                    style: h3.copyWith(
                      color: AppColors.normalBlue,
                      fontSize: 15.sp,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Obx(() {
                    final RxString devOption = ''.obs;
                    return Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => devOption.value = 'Developer',
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: devOption.value == 'Developer'
                                    ? AppColors.containerColor1
                                    : AppColors.tsWhite,
                                border: Border.all(
                                  color: AppColors.containerColor8,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.radio_button_checked,
                                    color: AppColors.containerColor8,
                                    size: 18.r,
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    'Developer',
                                    style: h4.copyWith(
                                      color: AppColors.normalBlue,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => devOption.value = 'Resale',
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: devOption.value == 'Resale'
                                    ? AppColors.containerColor1
                                    : AppColors.tsWhite,
                                border: Border.all(
                                  color: AppColors.containerColor8,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.radio_button_checked,
                                    color: AppColors.containerColor8,
                                    size: 18.r,
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    'Resale',
                                    style: h4.copyWith(
                                      color: AppColors.normalBlue,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),

                  SizedBox(height: 20.h),

                  // Size & Unit Type/View
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Size',
                              style: h4.copyWith(
                                color: AppColors.normalBlue,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            TextField(
                              controller: sizeController,
                              decoration: buildFieldDecoration('Type Here')
                                  .copyWith(
                                suffixIcon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.tsGray,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Unit Type/View',
                              style: h4.copyWith(
                                color: AppColors.normalBlue,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            TextField(
                              controller: unitTypeController,
                              decoration: buildFieldDecoration('Type Here')
                                  .copyWith(
                                suffixIcon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.tsGray,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  // Frequency
                  Text(
                    'Frequency',
                    style: h4.copyWith(
                      color: AppColors.normalBlue,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  TextField(
                    controller: frequencyController,
                    decoration: buildFieldDecoration('Type Here').copyWith(
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.tsGray,
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Seasons
                  Text(
                    'Seasons - Select all that apply',
                    style: h3.copyWith(
                      color: AppColors.normalBlue,
                      fontSize: 15.sp,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Obx(() {
                    return Column(
                      spacing: 12.h,
                      children: seasonOptions.map((s) {
                        final selected = selectedSeason.value == s;
                        return buildSelectTile(
                          label: s,
                          selected: selected,
                          onTap: () => selectedSeason.value = s,
                        );
                      }).toList(),
                    );
                  }),

                  SizedBox(height: 12.h),

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
                          'Add Option',
                          style: h2.copyWith(
                            color: AppColors.normalBlue,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      // TODO: add custom season option
                    },
                  ),

                  SizedBox(height: 20.h),

                  // Point value
                  Text(
                    'Point value',
                    style: h4.copyWith(
                      color: AppColors.normalBlue,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  TextField(
                    controller: pointValueController,
                    decoration: buildFieldDecoration('Type Here'),
                  ),

                  SizedBox(height: 16.h),

                  // Hilton Honors Conversion
                  Text(
                    'Hilton Honors Conversion',
                    style: h4.copyWith(
                      color: AppColors.normalBlue,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  TextField(
                    controller: honorsConversionController,
                    decoration: buildFieldDecoration('Type Here'),
                  ),

                  SizedBox(height: 24.h),

                  // Back / Next
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
