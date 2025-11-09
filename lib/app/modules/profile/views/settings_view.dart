import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/profile/controllers/profile_controller.dart';
import 'package:timeshare_secrets/app/modules/profile/views/change_password_view.dart';
import 'package:timeshare_secrets/app/modules/profile/views/edit_profile_view.dart';
import 'package:timeshare_secrets/app/modules/profile/views/help_support_view.dart';
import 'package:timeshare_secrets/app/modules/profile/views/logout_view.dart';
import 'package:timeshare_secrets/app/modules/profile/views/privacy_policy_view.dart';
import 'package:timeshare_secrets/app/modules/profile/views/share_your_idea_view.dart';
import 'package:timeshare_secrets/app/modules/profile/views/terms_conditions_view.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';

import '../../../../common/custom_fonts.dart';

class SettingsView extends GetView<ProfileController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SettingsAppBar(appBarText: 'Settings',),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 32.h,),

                Column(
                  spacing: 16.h,
                  children: [
                    SettingsCard(
                      icon: 'assets/images/profile/edit_profile.svg',
                      text: 'Edit Profile',
                      onTap: () => Get.to(EditProfileView()),
                    ),

                    SettingsCard(
                      icon: 'assets/images/profile/change_password.svg',
                      text: 'Change Password',
                      onTap: () => Get.to(ChangePasswordView()),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 14.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: AppColors.containerColor1,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 12.w,
                            children: [
                              SvgPicture.asset(
                                'assets/images/profile/notifications.svg',
                              ),

                              Text(
                                'Notifications',
                                style: h3.copyWith(
                                  color: AppColors.normalBlue,
                                  fontSize: 16.sp,
                                ),
                              )
                            ],
                          ),

                          Obx(() {
                            return GestureDetector(
                              onTap: () {
                                controller.notificationsEnabled.value = !controller.notificationsEnabled.value;
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: 3.98.h,
                                  bottom: 3.98.h,
                                  left: controller.notificationsEnabled.value ? 17.38.w : 3.98.w,
                                  right: controller.notificationsEnabled.value ? 3.98.w : 17.38.w,
                                ),
                                decoration: BoxDecoration(
                                  color: controller.notificationsEnabled.value ? AppColors.textColor1 : AppColors.textColor1.withAlpha(128),
                                  borderRadius: BorderRadius.circular(35.42.r),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(5.99.r),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.tsWhite,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),

                    SettingsCard(
                      icon: 'assets/images/profile/help_n_support.svg',
                      text: 'Help & Support',
                      onTap: () => Get.to(HelpSupportView()),
                    ),

                    SettingsCard(
                      icon: 'assets/images/profile/share_your_ideas.svg',
                      text: 'Share your ideas',
                      onTap: () => Get.to(ShareYourIdeaView()),
                    ),

                    SettingsCard(
                      icon: 'assets/images/profile/terms_conditions.svg',
                      text: 'Terms & Condition',
                      onTap: () => Get.to(TermsConditionsView()),
                    ),

                    SettingsCard(
                      icon: 'assets/images/profile/privacy_policy.svg',
                      text: 'Privacy Policy',
                      onTap: () => Get.to(PrivacyPolicyView()),
                    ),
                  ],
                ),

                SizedBox(height: 53.h,),

                CustomButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 10.h,
                  ),
                  color: AppColors.containerColor2,
                  buttonContent: Row(
                    spacing: 8.w,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/profile/logout.svg',
                      ),

                      Text(
                        'Log out',
                        style: h3.copyWith(
                          color: AppColors.tsWhite,
                          fontSize: 18.sp,
                        ),
                      )
                    ],
                  ),
                  onTap: () => Get.dialog(LogoutView()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class SettingsCard extends StatelessWidget {
  final String icon;
  final String text;
  final void Function()? onTap;

  const SettingsCard({
    required this.icon,
    required this.text,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 14.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.containerColor1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 12.w,
              children: [
                SvgPicture.asset(
                  icon,
                ),

                Text(
                  text,
                  style: h3.copyWith(
                    color: AppColors.normalBlue,
                    fontSize: 16.sp,
                  ),
                )
              ],
            ),

            Icon(
              Icons.arrow_forward_ios,
              size: 16.r,
              color: AppColors.normalBlue,
            )
          ],
        ),
      ),
    );
  }
}


class SettingsAppBar extends StatelessWidget {
  final String appBarText;

  const SettingsAppBar({
    required this.appBarText,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.tsWhite,
            ),
            child: Icon(
              Icons.arrow_back,
              size: 16.r,
              color: AppColors.textColor1,
            ),
          ),
        ),

        Text(
          appBarText,
          style: h2.copyWith(
            color: AppColors.tsWhite,
            fontSize: 24.sp,
          ),
        ),

        SizedBox.shrink(),
      ],
    );
  }
}
