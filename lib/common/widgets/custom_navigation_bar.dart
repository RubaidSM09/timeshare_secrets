import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../app/modules/dashboard/controllers/dashboard_controller.dart';
import '../app_colors.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    final List<Map<String, String>> navItems = [
      {
        'label': 'Home',
        'icon': 'assets/images/bottom_navigation_bar/home.svg',
      },
      {
        'label': 'Vault',
        'icon': 'assets/images/bottom_navigation_bar/vault2.svg',
      },
      {
        'label': 'Genie',
        'icon': 'assets/images/bottom_navigation_bar/genie.svg',
      },
      {
        'label': 'Profile',
        'icon': 'assets/images/bottom_navigation_bar/profile.svg',
      },
    ];

    return Container(
      height: 80.h,
      padding: EdgeInsets.only(left: 52.w, right: 52.w, top: 7.h, bottom: 17.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
          color: AppColors.containerColor1,
          boxShadow: [
            BoxShadow(
              color: AppColors.tsBlack.withAlpha(26),
              blurRadius: 5.r,
              offset: Offset(1.w, 1.h),
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(navItems.length, (index) {
          final item = navItems[index];
          return GestureDetector(
            onTap: () => controller.updateIndex(index),
            child: Obx(() {
              final isSelected = index == controller.currentIndex.value;
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 200), // Smooth transition duration
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: Column(
                  children: [
                    Expanded(
                      child: SvgPicture.asset(
                        item['icon']!,
                        color: isSelected ? AppColors.normalBlue : AppColors.textColor10,
                        key: ValueKey('${item['label']}_$isSelected'),
                      ),
                    ),

                    SizedBox(height: 6.h,),

                    Text(
                      item['label']!,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: isSelected ? AppColors.normalBlue : AppColors.textColor10,
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}
