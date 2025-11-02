import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_fonts.dart';

class Onboarding2View extends GetView {
  const Onboarding2View({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/onboarding/onboarding_1.svg'),

          SizedBox(height: 24.h),

          Text(
            'Timeshare Genie Behavior',
            style: h2.copyWith(color: AppColors.tsWhite, fontSize: 24.sp),
          ),

          SizedBox(height: 19.99.h),

          Text(
            'Below are some core behaviors list of the “Timeshare Genie”.',
            style: h4.copyWith(color: AppColors.textColor1, fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 44.h),

          Text(
            'The Answer Features :',
            style: h3.copyWith(color: AppColors.tsWhite, fontSize: 14.sp),
          ),

          SizedBox(height: 12.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnswerFeaturesCard(
                icon: 'assets/images/onboarding/answer_features.svg',
                title: 'Concise summaries',
                subTitle: 'Just the facts, quick and to the point',
              ),

              AnswerFeaturesCard(
                icon: 'assets/images/onboarding/answer_features.svg',
                title: 'Detailed breakdowns',
                subTitle: 'In-depth explanations with context',
              ),
            ],
          ),

          SizedBox(height: 24.17.h),

          Text(
            'Languages It Speaks :',
            style: h3.copyWith(color: AppColors.tsWhite, fontSize: 14.sp),
          ),

          SizedBox(height: 12.h),

          Wrap(
            spacing: 14.w,
            runSpacing: 14.h,
            children: [
              LanguagesSpeakCard(language: 'English'),

              LanguagesSpeakCard(language: 'Español (Spanish)'),

              LanguagesSpeakCard(language: 'Français (French)'),

              LanguagesSpeakCard(language: 'Português (Portuguese)'),

              LanguagesSpeakCard(language: 'Deutsch (German)'),

              LanguagesSpeakCard(language: '日本語 (Japanese)'),

              LanguagesSpeakCard(language: 'Italiano (Italian)'),

              LanguagesSpeakCard(language: '한국어 (Korean)'),

              LanguagesSpeakCard(language: '中文 — 简体中文 (Mandarin Chinese)'),
            ],
          ),
        ],
      ),
    );
  }
}

class AnswerFeaturesCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subTitle;

  const AnswerFeaturesCard({
    required this.icon,
    required this.title,
    required this.subTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.14.r),
        gradient: LinearGradient(colors: AppColors.containerGradientColor),
        border: Border.all(color: AppColors.textColor1, width: 0.86.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(icon),

          SizedBox(height: 6.85.h),

          Text(
            title,
            style: h2.copyWith(color: AppColors.tsWhite, fontSize: 10.sp),
          ),

          SizedBox(height: 5.14.h),

          Text(
            subTitle,
            style: h4.copyWith(color: AppColors.textColor2, fontSize: 8.sp),
          ),
        ],
      ),
    );
  }
}

class LanguagesSpeakCard extends StatelessWidget {
  final String language;

  const LanguagesSpeakCard({required this.language, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.14.r),
        gradient: LinearGradient(colors: AppColors.containerGradientColor),
        border: Border.all(color: AppColors.textColor1, width: 0.5.r),
      ),
      child: Text(
        language,
        style: h2.copyWith(color: AppColors.tsWhite, fontSize: 9.sp),
      ),
    );
  }
}
