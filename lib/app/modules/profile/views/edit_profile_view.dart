import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/profile/views/settings_view.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';
import 'package:timeshare_secrets/common/widgets/custom_text_fields.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_fonts.dart';

class EditProfileView extends GetView {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SettingsAppBar(appBarText: 'Edit Profile Option',),
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
                    horizontal: 25.w,
                    vertical: 17.h,
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
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 35.r,
                            backgroundImage: AssetImage(
                              'assets/images/home/home_profile.jpg',
                            ),
                          ),

                          Positioned(
                            right: -8.w,
                            bottom: 6.h,
                            child: SvgPicture.asset(
                              'assets/images/profile/camera.svg',
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 8.h,),

                      Text(
                        'Alex Martin',
                        style: h2.copyWith(
                          color: AppColors.tsWhite,
                          fontSize: 20.sp,
                        ),
                      ),

                      SizedBox(height: 9.h,),

                      Row(
                        children: [
                          Text(
                            'Name',
                            style: h4.copyWith(
                              color: AppColors.textColor1,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 4.h,),
                      
                      CustomTextFields(
                        hintText: 'Alex Martin',
                        color: AppColors.containerColor1,
                        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 11.h,),
                        hintTextColor: AppColors.textColor12,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.tsBlack.withAlpha(64),
                            blurRadius: 2.r,
                          ),
                        ],
                        isObscureText: false.obs,
                      ),

                      SizedBox(height: 8.h,),

                      Row(
                        children: [
                          Text(
                            'E-mail',
                            style: h4.copyWith(
                              color: AppColors.textColor1,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 4.h,),

                      CustomTextFields(
                        hintText: 'danmith1234@gmail.com',
                        color: AppColors.containerColor1,
                        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 11.h,),
                        hintTextColor: AppColors.textColor12,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.tsBlack.withAlpha(64),
                            blurRadius: 2.r,
                          ),
                        ],
                        isObscureText: false.obs,
                      ),

                      SizedBox(height: 8.h,),

                      Row(
                        children: [
                          Text(
                            'Phone',
                            style: h4.copyWith(
                              color: AppColors.textColor1,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 4.h,),

                      CustomTextFields(
                        hintText: '+1 123745689',
                        color: AppColors.containerColor1,
                        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 11.h,),
                        hintTextColor: AppColors.textColor12,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.tsBlack.withAlpha(64),
                            blurRadius: 2.r,
                          ),
                        ],
                        isObscureText: false.obs,
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
                        'Save',
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
