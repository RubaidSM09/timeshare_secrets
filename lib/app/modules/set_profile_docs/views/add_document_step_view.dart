import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/set_profile_docs/controllers/set_profile_docs_controller.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';

class AddDocumentStepView extends GetView<SetProfileDocsController> {
  const AddDocumentStepView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    'Add Your First Document',
                    style: h2.copyWith(
                      color: AppColors.normalBlue,
                      fontSize: 22.sp,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  // Subtitle
                  Text(
                    'Upload a contract, disclosure guide, or fee bill. Genie '
                        'will secure it, read it, and explain it in the language you '
                        'selected.',
                    style: h4.copyWith(
                      color: AppColors.tsGray,
                      fontSize: 14.sp,
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Upload area
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 40.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: AppColors.containerColor8, // your yellow
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.upload_rounded,
                          size: 40.r,
                          color: AppColors.tsGray,
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Click to upload or drag and drop',
                          style: h4.copyWith(
                            color: AppColors.normalBlue,
                            fontSize: 14.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'PDF, DOC (Max 200MB)',
                          style: h4.copyWith(
                            color: AppColors.tsGray,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Info box: examples
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.containerColor1, // light yellow-ish bg
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: h4.copyWith(
                          color: AppColors.textColor1,
                          fontSize: 13.sp,
                        ),
                        children: [
                          const TextSpan(
                            text:
                            'Please upload the required documents as per the given examples for smooth processing : ',
                          ),
                          TextSpan(
                            text:
                            'Sales Contract, Public Offerings, Offering statement, Maintenance fees, Reservations',
                            style: h4.copyWith(
                              color: AppColors.normalBlue,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // Info box: Forever Free
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.containerColor8, // main yellow
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Forever Free = 3 docs (200MB), ~150 pages review',
                          style: h4.copyWith(
                            color: AppColors.normalBlue,
                            fontSize: 13.sp,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Upgrade anytime for unlimited.',
                          style: h4.copyWith(
                            color: AppColors.normalBlue,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Upload Document button
                  CustomButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 12.h,
                    ),
                    color: AppColors.textColor1, // golden
                    buttonContent: Center(
                      child: Text(
                        'Upload Document',
                        style: h2.copyWith(
                          color: AppColors.normalBlue,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    onTap: () {
                      // TODO: implement upload logic
                    },
                  ),

                  SizedBox(height: 16.h),

                  // Skip button (outlined-style)
                  GestureDetector(
                    onTap: () {
                      controller.goNext();
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.tsWhite,
                        border: Border.all(
                          color: AppColors.normalBlue,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Skip',
                          style: h2.copyWith(
                            color: AppColors.normalBlue,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Center(
                    child: Text(
                      'You can upload anytime in the Vault',
                      style: h4.copyWith(
                        color: AppColors.tsGray,
                        fontSize: 12.sp,
                      ),
                    ),
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
