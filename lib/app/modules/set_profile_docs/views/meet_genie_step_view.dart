import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/dashboard/views/dashboard_view.dart';
import 'package:timeshare_secrets/app/modules/genie/views/genie_view.dart';

import 'package:timeshare_secrets/app/modules/set_profile_docs/controllers/set_profile_docs_controller.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';

class MeetGenieStepView extends GetView<SetProfileDocsController> {
  const MeetGenieStepView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              children: [
                // Center content
                Column(
                  children: [
                    Text(
                      'Meet Your Timeshare Genie',
                      style: h2.copyWith(
                        color: AppColors.tsBlack,
                        fontSize: 20.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      'Ask Genie any question — from booking rules to fees\n'
                          'to resale — and receive clear, bias-free answers\n'
                          'tailored to your ownership, in your preferred language.',
                      style: h4.copyWith(
                        color: AppColors.tsBlur,
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.start,
                    ),

                    SizedBox(height: 36.h),

                    // Genie circle icon
                    Container(
                      height: 137.54.h,
                      width: 140.w,
                      padding: EdgeInsets.all(19.65.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.textColor1,
                      ),
                      child: SvgPicture.asset(
                        'assets/images/set_profile_docs/time_genie.svg',
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 60.h,),

                // Bottom buttons + caption
                Column(
                  children: [
                    // Primary "Tap to speak with AI"
                    CustomButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 12.h,
                      ),
                      color: AppColors.textColor1,
                      buttonContent: Center(
                        child: Text(
                          'Tap  to speak with AI',
                          style: h2.copyWith(
                            color: AppColors.normalBlue,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                      onTap: () {
                        // TODO: navigate to Genie chat / voice screen
                        Get.offAll(DashboardView());
                        Get.to(GenieView());
                      },
                    ),

                    SizedBox(height: 16.h),

                    // Secondary "Skip"
                    GestureDetector(
                      onTap: () {
                        Get.offAll(DashboardView());
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
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Skip',
                            style: h2.copyWith(
                              color: AppColors.normalBlue,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 12.h),

                    Text(
                      'You can speak with ai later in the app',
                      style: h4.copyWith(
                        color: AppColors.tsGray,
                        fontSize: 13.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
