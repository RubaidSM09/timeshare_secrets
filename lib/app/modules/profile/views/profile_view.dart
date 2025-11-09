import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/profile/views/settings_view.dart';
import 'package:timeshare_secrets/app/modules/profile/views/subscription_plans_view.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 16.w,
              children: [
                CircleAvatar(
                  radius: 32.r,
                  backgroundImage: AssetImage(
                    'assets/images/home/home_profile.jpg',
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12.h,
                  children: [
                    Text(
                      'Alex Martin',
                      style: h1.copyWith(
                        color: AppColors.tsWhite,
                        fontSize: 22.sp,
                      ),
                    ),

                    Text(
                      'user123@gmail.com',
                      style: h4.copyWith(
                        color: AppColors.textColor14,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            CustomButton(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 8.h,
              ),
              border: Border.all(
                color: AppColors.textColor1,
              ),
              buttonContent: Text(
                'Settings',
                style: h3.copyWith(
                  color: AppColors.tsWhite,
                  fontSize: 12.sp,
                ),
              ),
              onTap: () => Get.to(SettingsView()),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h,),

                IntrinsicHeight(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 24.w,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 14.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.containerColor1,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: AppColors.textColor1,
                              width: 0.5.r,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 12.h,
                            children: [
                              Text(
                                'PRIMARY BRAND',
                                style: h4.copyWith(
                                  color: AppColors.textColor1,
                                  fontSize: 12.sp,
                                ),
                              ),
                  
                              Text(
                                'Hilton Grand Vacations',
                                style: h3.copyWith(
                                  color: AppColors.normalBlue,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 14.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.containerColor1,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: AppColors.textColor1,
                              width: 0.5.r,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 12.h,
                            children: [
                              Text(
                                'TIER LEVEL',
                                style: h4.copyWith(
                                  color: AppColors.textColor1,
                                  fontSize: 12.sp,
                                ),
                              ),
                  
                              Text(
                                'Premier Plus',
                                style: h3.copyWith(
                                  color: AppColors.normalBlue,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h,),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.containerColor1,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: AppColors.textColor1,
                      width: 0.5.r,
                    ),
                  ),
                  child: Column(
                    spacing: 12.h,
                    children: [
                      Text(
                        'HOME RESORT',
                        style: h4.copyWith(
                          color: AppColors.textColor1,
                          fontSize: 12.sp,
                        ),
                      ),

                      Text(
                        'SeaWorld Orlando',
                        style: h3.copyWith(
                          color: AppColors.normalBlue,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30.h,),

                Text(
                  'Active Contracts',
                  style: h2.copyWith(
                    color: AppColors.tsWhite,
                    fontSize: 24.sp,
                  ),
                ),

                SizedBox(height: 16.h,),

                IntrinsicHeight(
                  child: Row(
                    spacing: 24.w,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 14.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.containerColor1.withAlpha(38),
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: AppColors.textColor1,
                              width: 0.5.r,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 12.h,
                            children: [
                              Text(
                                'POINTS',
                                style: h4.copyWith(
                                  color: AppColors.textColor1,
                                  fontSize: 12.sp,
                                ),
                              ),
                  
                              Text(
                                '15,000 HGV Points',
                                style: h3.copyWith(
                                  color: AppColors.tsWhite,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 14.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.containerColor1.withAlpha(38),
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: AppColors.textColor1,
                              width: 0.5.r,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 12.h,
                            children: [
                              Text(
                                'USE YEAR',
                                style: h4.copyWith(
                                  color: AppColors.textColor1,
                                  fontSize: 12.sp,
                                ),
                              ),
                  
                              Text(
                                '2025',
                                style: h3.copyWith(
                                  color: AppColors.tsWhite,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h,),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.containerColor1.withAlpha(38),
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: AppColors.textColor1,
                      width: 0.5.r,
                    ),
                  ),
                  child: Column(
                    spacing: 12.h,
                    children: [
                      Text(
                        'UNIT TYPE',
                        style: h4.copyWith(
                          color: AppColors.textColor1,
                          fontSize: 12.sp,
                        ),
                      ),

                      Text(
                        '2-Bedroom Villa',
                        style: h3.copyWith(
                          color: AppColors.tsWhite,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30.h,),

                Text(
                  'Quick Stats',
                  style: h2.copyWith(
                    color: AppColors.tsWhite,
                    fontSize: 24.sp,
                  ),
                ),

                SizedBox(height: 16.h,),

                IntrinsicHeight(
                  child: Row(
                    spacing: 24.w,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 14.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.containerColor1.withAlpha(38),
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: AppColors.textColor1,
                              width: 0.5.r,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 12.h,
                            children: [
                              Text(
                                'BOOKING WINDOW',
                                style: h4.copyWith(
                                  color: AppColors.textColor1,
                                  fontSize: 12.sp,
                                ),
                              ),

                              Text(
                                '274 days advance',
                                style: h3.copyWith(
                                  color: AppColors.tsWhite,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 14.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.containerColor1.withAlpha(38),
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: AppColors.textColor1,
                              width: 0.5.r,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 12.h,
                            children: [
                              Text(
                                'NEXT DEADLINE',
                                style: h4.copyWith(
                                  color: AppColors.textColor1,
                                  fontSize: 12.sp,
                                ),
                              ),

                              Text(
                                'Dec 31, 2025',
                                style: h3.copyWith(
                                  color: AppColors.tsWhite,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 12.h,
                  ),
                  color: AppColors.textColor1,
                  buttonContent: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Upgrade My Plan',
                        style: h2.copyWith(
                          color: AppColors.normalBlue,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Get.to(SubscriptionPlansView()),
                ),

                SizedBox(height: 94.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
