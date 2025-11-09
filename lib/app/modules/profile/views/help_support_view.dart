import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/profile/views/settings_view.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_fonts.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_text_fields.dart';

class HelpSupportView extends GetView {
  const HelpSupportView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SettingsAppBar(appBarText: 'Help & Support',),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 32.h,),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.containerColor1.withAlpha(38),
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: AppColors.textColor1,
                      )
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'E-mail',
                            style: h2.copyWith(
                              color: AppColors.textColor1,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 5.h,),

                      CustomTextFields(
                        hintText: 'Enter Email',
                        color: AppColors.tsWhite,
                        borderColor: AppColors.borderColor3,
                        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.h,),
                        hintTextColor: AppColors.borderColor3,
                        isObscureText: false.obs,
                      ),

                      SizedBox(height: 16.h,),

                      Row(
                        children: [
                          Text(
                            'Problem',
                            style: h2.copyWith(
                              color: AppColors.textColor1,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 5.h,),

                      CustomTextFields(
                        hintText: 'Describe Your Problem',
                        color: AppColors.tsWhite,
                        borderColor: AppColors.borderColor3,
                        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.h,),
                        hintTextColor: AppColors.borderColor3,
                        maxLine: 4,
                        isObscureText: false.obs,
                      ),

                      SizedBox(height: 16.h,),

                      Row(
                        children: [
                          Text(
                            'Screenshot ( Optional )',
                            style: h2.copyWith(
                              color: AppColors.textColor1,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 5.h,),

                      GestureDetector(
                        onTap: () {  },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.22.h,),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: AppColors.borderColor4,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/profile/camera2.svg',
                                  ),

                                  SizedBox(height: 6.h,),

                                  Text(
                                    'Tap to add a screenshot',
                                    style: h4.copyWith(
                                      color: AppColors.textColor15,
                                      fontSize: 15.56.sp,
                                    ),
                                  ),

                                  SizedBox(height: 4.h,),

                                  Text(
                                    'JPG, PNG up to 5MB',
                                    style: h4.copyWith(
                                      color: AppColors.textColor1,
                                      fontSize: 13.33.sp,
                                    ),
                                  ),
                                ],
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
                  padding: EdgeInsets.all(10.r),
                  color: AppColors.textColor1,
                  buttonContent: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Send',
                        style: h2.copyWith(
                          color: AppColors.tsWhite,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
