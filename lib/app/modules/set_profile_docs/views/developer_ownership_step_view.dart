import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:timeshare_secrets/app/modules/set_profile_docs/controllers/set_profile_docs_controller.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';
import 'package:timeshare_secrets/common/widgets/custom_text_fields.dart';

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
                selected ? Icons.radio_button_checked : Icons.radio_button_off,
                color: AppColors.containerColor8,
                size: 16.r,
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  label,
                  style: h4.copyWith(
                    color: AppColors.textColor6,
                    fontSize: 16.sp,
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
                      color: AppColors.tsBlack,
                      fontSize: 20.sp,
                    ),
                  ),

                  SizedBox(height: 22.h),

                  Center(
                    child: Text(
                      'Select all that apply',
                      style: h4.copyWith(
                        color: AppColors.textColor21,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),

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

                  SizedBox(height: 12.h),

                  // Add Option button
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
                          'Add Option',
                          style: h4.copyWith(
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
                    style: h2.copyWith(
                      color: AppColors.normalBlue,
                      fontSize: 18.sp,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  // Entity 1
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 6.h,
                        ),
                        height: 44.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6.r),
                            bottomLeft: Radius.circular(6.r),
                          ),
                          color: AppColors.textColor1,
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: h2.copyWith(
                              color: AppColors.tsBlack,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                          height: 44.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.textColor24,
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(6.r),
                              bottomRight: Radius.circular(6.r),
                            )
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,

                              hintText: 'Type Here',
                              hintStyle: h4.copyWith(
                                color: AppColors.textColor23,
                                fontSize: 14.sp,
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),

                              suffixIcon: SizedBox(
                                width: 24.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 20.r,
                                      color: AppColors.normalBlue,
                                    ),
                                  ],
                                ),
                              )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 6.h),

                  // Entity 2
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 6.h,
                        ),
                        height: 44.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6.r),
                            bottomLeft: Radius.circular(6.r),
                          ),
                          color: AppColors.textColor1,
                        ),
                        child: Center(
                          child: Text(
                            '2',
                            style: h2.copyWith(
                              color: AppColors.tsBlack,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                          height: 44.h,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.textColor24,
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(6.r),
                                bottomRight: Radius.circular(6.r),
                              )
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,

                                hintText: 'Type Here',
                                hintStyle: h4.copyWith(
                                  color: AppColors.textColor23,
                                  fontSize: 14.sp,
                                ),

                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),

                                suffixIcon: SizedBox(
                                  width: 24.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 20.r,
                                        color: AppColors.normalBlue,
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

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
                          'Add Another Property',
                          style: h4.copyWith(
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

                  // Choose a Developer option
                  Text(
                    'Choose a Developer option',
                    style: h2.copyWith(
                      color: AppColors.normalBlue,
                      fontSize: 18.sp,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  Obx(() {
                    final RxString devOption = ''.obs;
                    return Row(
                      spacing: 22.w,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => devOption.value = 'Developer',
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.h,
                                horizontal: 16.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                color: devOption.value == 'Developer'
                                    ? AppColors.containerColor1
                                    : AppColors.tsWhite,
                                border: Border.all(
                                  color: AppColors.textColor24,
                                ),
                              ),
                              child: Row(
                                spacing: 8.w,
                                children: [
                                  Icon(
                                    devOption.value == 'Developer' ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                                    color: AppColors.textColor1,
                                    size: 16.r,
                                  ),

                                  Text(
                                    'Developer',
                                    style: h3.copyWith(
                                      color: AppColors.normalBlue,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => devOption.value = 'Resale',
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.h,
                                horizontal: 16.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                color: devOption.value == 'Resale'
                                    ? AppColors.containerColor1
                                    : AppColors.tsWhite,
                                border: Border.all(
                                  color: AppColors.textColor24,
                                ),
                              ),
                              child: Row(
                                spacing: 8.w,
                                children: [
                                  Icon(devOption.value == 'Resale' ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                                    color: AppColors.textColor1,
                                    size: 16.r,
                                  ),
                                  Text(
                                    'Resale',
                                    style: h3.copyWith(
                                      color: AppColors.normalBlue,
                                      fontSize: 16.sp,
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

                  SizedBox(height: 24.h),

                  // Size & Unit Type/View
                  Row(
                    spacing: 24.w,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Size',
                              style: h2.copyWith(
                                color: AppColors.normalBlue,
                                fontSize: 18.sp,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                              height: 44.h,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.textColor24,
                                  ),
                                  borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,

                                    hintText: 'Type Here',
                                    hintStyle: h4.copyWith(
                                      color: AppColors.textColor23,
                                      fontSize: 14.sp,
                                    ),

                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),

                                    suffixIcon: SizedBox(
                                      width: 24.w,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 20.r,
                                            color: AppColors.normalBlue,
                                          ),
                                        ],
                                      ),
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Unit Type/View',
                              style: h2.copyWith(
                                color: AppColors.normalBlue,
                                fontSize: 18.sp,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                              height: 44.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.textColor24,
                                ),
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,

                                    hintText: 'Type Here',
                                    hintStyle: h4.copyWith(
                                      color: AppColors.textColor23,
                                      fontSize: 14.sp,
                                    ),

                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),

                                    suffixIcon: SizedBox(
                                      width: 24.w,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 20.r,
                                            color: AppColors.normalBlue,
                                          ),
                                        ],
                                      ),
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  // Frequency
                  Text(
                    'Frequency',
                    style: h2.copyWith(
                      color: AppColors.normalBlue,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    height: 44.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.textColor24,
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,

                          hintText: 'Type Here',
                          hintStyle: h4.copyWith(
                            color: AppColors.textColor23,
                            fontSize: 14.sp,
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),

                          suffixIcon: SizedBox(
                            width: 24.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 20.r,
                                  color: AppColors.normalBlue,
                                ),
                              ],
                            ),
                          )
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Seasons
                  Center(
                    child: Text(
                      'Seasons - Select all that apply',
                      style: h4.copyWith(
                        color: AppColors.normalBlue,
                        fontSize: 16.sp,
                      ),
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
                        SizedBox(width: 6.w),
                        Text(
                          'Add Option',
                          style: h4.copyWith(
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

                  SizedBox(height: 24.h),

                  // Point value
                  Text(
                    'Point value',
                    style: h2.copyWith(
                      color: AppColors.normalBlue,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    height: 44.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.textColor24,
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,

                          hintText: 'Type Here',
                          hintStyle: h4.copyWith(
                            color: AppColors.textColor23,
                            fontSize: 14.sp,
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Hilton Honors Conversion
                  Text(
                    'Hilton Honors Conversion',
                    style: h2.copyWith(
                      color: AppColors.normalBlue,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    height: 44.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.textColor24,
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,

                        hintText: 'Type Here',
                        hintStyle: h4.copyWith(
                          color: AppColors.textColor23,
                          fontSize: 14.sp,
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 125.h),

                  // Back / Next
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
