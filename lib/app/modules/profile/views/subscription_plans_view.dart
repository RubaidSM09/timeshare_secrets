import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/profile/controllers/profile_controller.dart';
import 'package:timeshare_secrets/app/modules/profile/views/settings_view.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_fonts.dart';
import '../../home/views/home_view.dart';

class SubscriptionPlansView extends GetView<ProfileController> {
  const SubscriptionPlansView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SettingsAppBar(appBarText: 'Subscription Plans',),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w,),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.h,),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.39.h,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: AppColors.containerColor1,
                  ),
                  child: Stack(
                    children: [
                      Row(
                        spacing: 12.w,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            spacing: 10.h,
                            children: [
                              SizedBox.shrink(),

                              CircularDonut(
                                value: 0.26,
                                size: 140.w, // you can keep this scaled to your design
                                strokeWidth: 20.r,
                                percentStyle: h1.copyWith(
                                  color: AppColors.normalBlue,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                remainingStyle: h4.copyWith(
                                  color: AppColors.tsGray,
                                  fontSize: 12.sp,
                                ),
                                remainingText: 'Remaining : 74%',
                                backgroundRing: const Color(0xFFDADDDC), // pale ring (adjust if you want)
                                foregroundArc: AppColors.normalBlue, // dark arc color
                              ),

                              SizedBox.shrink(),
                            ],
                          ),

                          Column(
                            spacing: 14.h,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox.shrink(),

                              Text(
                                'Storage & Plan Details',
                                style: h2.copyWith(
                                  color: AppColors.textColor7,
                                  fontSize: 16.sp,
                                ),
                              ),

                              StoragePlanChipsGrid(
                                titles: const [
                                  'Storage 2GB',
                                  '50 AI queries',
                                  'Email support',
                                  'Basic use',
                                ],
                                preferredColumns: 2,   // tries 2 per row; will auto-fall-back if tight
                                rowSpacing: 10,
                                colSpacing: 10,
                              ),

                              SizedBox.shrink(),
                            ],
                          ),
                        ],
                      ),

                      Positioned(
                        right: 0.w,
                        top: 0.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h,),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: AppColors.textColor1,
                          ),
                          child: Text(
                            'Free Plan',
                            style: h3.copyWith(
                              color: AppColors.normalBlue,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 30.h,),

                Text(
                  'All Plans',
                  style: h2.copyWith(
                    color: AppColors.tsWhite,
                    fontSize: 24.sp,
                  ),
                ),

                SizedBox(height: 16.h,),

                Column(
                  spacing: 24.h,
                  children: controller.subscriptionPlans.map((subscriptionPlan) {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.r),
                              topRight: Radius.circular(16.r),
                            ),
                            color: AppColors.tsWhite,
                          ),
                          child: Center(
                            child: Text(
                              subscriptionPlan['tagline'],
                              style: h3.copyWith(
                                color: AppColors.textColor1,
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32.w,
                            vertical: 40.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.r),
                              bottomRight: Radius.circular(16.r),
                            ),
                            gradient: LinearGradient(
                              colors: AppColors.containerGradientColor3,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            border: Border.all(
                              color: AppColors.textColor1,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                subscriptionPlan['price'],
                                style: h2.copyWith(
                                  color: AppColors.tsWhite,
                                  fontSize: 48.sp,
                                ),
                              ),

                              SizedBox(height: 16.h,),

                              Text(
                                subscriptionPlan['title'],
                                style: h2.copyWith(
                                  color: AppColors.textColor1,
                                  fontSize: 26.sp,
                                ),
                              ),

                              SizedBox(height: 14.h,),

                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10.r),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  border: Border.all(
                                    color: AppColors.textColor1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    subscriptionPlan['badge'],
                                    style: h3.copyWith(
                                      color: AppColors.tsWhite,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 14.h,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 5.w,
                                children: [
                                  Text(
                                    subscriptionPlan['annualPrice'],
                                    style: h2.copyWith(
                                      color: AppColors.textColor1,
                                      fontSize: 20.sp,
                                    ),
                                  ),

                                  Text(
                                    '-',
                                    style: h2.copyWith(
                                      color: AppColors.textColor1,
                                      fontSize: 20.sp,
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: () {  },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 6.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100.r),
                                        color: AppColors.textColor1.withAlpha(77),
                                        border: Border.all(
                                          color: AppColors.textColor1,
                                        ),
                                      ),
                                      child: Text(
                                        subscriptionPlan['ctaLabel'],
                                        style: h3.copyWith(
                                          color: AppColors.tsWhite,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),

                              SizedBox(height: 32.h,),

                              Column(
                                spacing: 16.h,
                                children: (subscriptionPlan['features'] as List<dynamic>).cast<String>().map<Widget>((feature) {
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    spacing: 12.w,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(6.r),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.containerColor4,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          size: 12.r,
                                          color: AppColors.textColor1,
                                        ),
                                      ),

                                      Expanded(
                                        child: Text(
                                          feature,
                                          style: h4.copyWith(
                                            color: AppColors.tsWhite,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),

                              SizedBox(height: 40.h,),

                              CustomButton(
                                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h,),
                                color: AppColors.containerColor5,
                                border: Border.all(
                                  color: AppColors.textColor1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.boxShadowColor1.withAlpha(13),
                                    blurRadius: 2.r,
                                    offset: Offset(0.w, 1.h),
                                  )
                                ],
                                buttonContent: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      subscriptionPlan['buttonText'],
                                      style: h2.copyWith(
                                        color: AppColors.tsWhite,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {  },
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }).toList(),
                ),

                SizedBox(height: 30.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
