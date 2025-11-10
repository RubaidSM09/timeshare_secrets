import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'Add Your First Document',
                  style: h2.copyWith(
                    color: AppColors.tsBlack,
                    fontSize: 20.sp,
                  ),
                ),

                SizedBox(height: 6.h),

                // Subtitle
                Text(
                  'Upload a contract, disclosure guide, or fee bill. Genie will secure it, read it, and explain it in the language you selected.',
                  style: h4.copyWith(
                    color: AppColors.textColor19,
                    fontSize: 14.sp,
                  ),
                ),

                SizedBox(height: 24.h),

                // Upload area
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.r),
                    child: DottedBorder(
                      options: RectDottedBorderOptions(
                        dashPattern: [2.w, 2.h],
                        strokeWidth: 4.r,
                        color: AppColors.textColor1,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(26.r),
                        child: Center(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'assets/images/set_profile_docs/upload.svg',
                              ),

                              SizedBox(height: 8.h),

                              Text(
                                'Click to upload or drag and drop',
                                style: h3.copyWith(
                                  color: AppColors.textColor20,
                                  fontSize: 11.9.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),

                              Text(
                                'PDF, DOC (Max 200MB)',
                                style: h4.copyWith(
                                  color: AppColors.tsGray,
                                  fontSize: 10.2.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 12.h),

                // Info box: examples
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: AppColors.textColor1,
                    )
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: h3.copyWith(
                        color: AppColors.textColor10,
                        fontSize: 12.sp,
                      ),
                      children: [
                        const TextSpan(
                          text:
                          'Please upload the required documents as per the given examples for smooth processing ',
                        ),
                        TextSpan(
                          text:
                          ': Sales Contract, Public Offerings, Offering statement, Maintenance fees, Reservations',
                          style: h3.copyWith(
                            color: AppColors.textColor1,
                            fontSize: 12.sp,
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
                  padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 11.h,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: AppColors.containerColor10,
                    border: Border.all(
                      color: AppColors.borderColor6,
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Forever Free = 3 docs (200MB), ~150 pages review',
                        style: h2.copyWith(
                          color: AppColors.normalBlue,
                          fontSize: 12.sp,
                        ),
                      ),

                      SizedBox(height: 4.h),

                      Text(
                        'Upgrade anytime for unlimited.',
                        style: h4.copyWith(
                          color: AppColors.normalBlue,
                          fontSize: 11.9.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                // Upload Document button
                CustomButton(
                  padding: EdgeInsets.all(10.r),
                  color: AppColors.textColor1,
                  buttonContent: Center(
                    child: Text(
                      'Upload Document',
                      style: h2.copyWith(
                        color: AppColors.normalBlue,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  onTap: () {
                    // TODO: implement upload logic
                  },
                ),

                SizedBox(height: 16.h),

                // Skip button (outlined-style)
                CustomButton(
                  padding: EdgeInsets.all(10.r),
                  border: Border.all(
                    color: AppColors.textColor1,
                  ),
                  buttonContent: Center(
                    child: Text(
                      'Skip',
                      style: h2.copyWith(
                        color: AppColors.normalBlue,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  onTap: () {
                    // TODO: implement upload logic
                  },
                ),

                SizedBox(height: 12.h),

                Center(
                  child: Text(
                    'You can upload anytime in the Vault',
                    style: h4.copyWith(
                      color: AppColors.tsGray,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
