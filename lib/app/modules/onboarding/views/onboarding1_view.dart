import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';

class Onboarding1View extends GetView {
  const Onboarding1View({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/onboarding/onboarding_1.svg'
          ),

          SizedBox(height: 24.h,),

          Text(
            'What is Timeshare Genie?',
            style: h2.copyWith(
              color: AppColors.tsWhite,
              fontSize: 24.sp,
            ),
          ),

          SizedBox(height: 19.99.h,),

          Text(
            '“Your most trusted timeshare advisor with complete knowledge of your ownership, vault documents, and insider strategies to maximize your investment value.”',
            style: h4.copyWith(
              color: AppColors.textColor1,
              fontSize: 16.sp,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 40.01.h,),

          Text(
            'The Core Features',
            style: h3.copyWith(
              color: AppColors.tsWhite,
              fontSize: 14.sp,
            ),
          ),

          SizedBox(height: 12.h,),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12.86.h,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10.28.w,
                children: [
                  CoreFeaturesCard(
                    icon: 'assets/images/onboarding/trusted_advisor.svg',
                    title: 'Your Trusted Advisor',
                    subTitle: 'Ask anything about your ownership and\nget clear, unbiased answers.',
                  ),

                  CoreFeaturesCard(
                    icon: 'assets/images/onboarding/vault.svg',
                    title: 'The Vault',
                    subTitle: 'Ask anything about your ownership and\nget clear, unbiased answers.',
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10.28.w,
                children: [
                  CoreFeaturesCard(
                    icon: 'assets/images/onboarding/current_updates.svg',
                    title: 'Always Current Updates',
                    subTitle: 'Ask anything about your ownership and\nget clear, unbiased answers.',
                  ),

                  CoreFeaturesCard(
                    icon: 'assets/images/onboarding/critical_changes.svg',
                    title: 'Critical Changes, Simplified',
                    subTitle: 'Ask anything about your ownership and\nget clear, unbiased answers.',
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}


class CoreFeaturesCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subTitle;

  const CoreFeaturesCard({
    required this.icon,
    required this.title,
    required this.subTitle,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.14.r),
        gradient: LinearGradient(
          colors: AppColors.containerGradientColor,
        ),
        border: Border.all(
          color: AppColors.textColor1,
          width: 0.86.r,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            icon
          ),

          SizedBox(height: 6.85.h,),

          Text(
            title,
            style: h2.copyWith(
              color: AppColors.tsWhite,
              fontSize: 10.sp,
            ),
          ),

          SizedBox(height: 5.14.h,),

          Text(
            subTitle,
            style: h4.copyWith(
              color: AppColors.textColor2,
              fontSize: 8.sp,
            ),
          ),
        ],
      ),
    );
  }
}
