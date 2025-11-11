import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:timeshare_secrets/app/modules/set_profile_docs/controllers/set_profile_docs_controller.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';

class ExampleImagesStepView extends GetView<SetProfileDocsController> {
  const ExampleImagesStepView({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    final RxInt currentPage = 0.obs;

    // TODO: replace with your real image asset paths
    final List<String> imageAssets = [
      'assets/images/set_profile_docs/example_1.png',
      'assets/images/set_profile_docs/example_1.png',
      'assets/images/set_profile_docs/example_1.png',
      'assets/images/set_profile_docs/example_1.png',
      'assets/images/set_profile_docs/example_1.png',
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              children: [
                // Center content: title + carousel + dots
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Examples Images that you need to\nupload for profile set up.',
                      style: h2.copyWith(
                        color: AppColors.normalBlue,
                        fontSize: 20.sp,
                      ),
                      textAlign: TextAlign.start,
                    ),

                    // SizedBox(height: 24.h),

                    SizedBox(
                      height: 379.h,
                      child: Row(
                        spacing: 24.w,
                        children: [
                          // Left arrow
                          GestureDetector(
                            onTap: () {
                              if (currentPage.value > 0) {
                                pageController.previousPage(
                                  duration:
                                  const Duration(milliseconds: 250),
                                  curve: Curves.easeOut,
                                );
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.77.w,
                                vertical: 8.52.h,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.normalBlue,
                              ),
                              child: Icon(
                                Icons.chevron_left,
                                color: AppColors.tsWhite,
                                size: 20.r,
                              ),
                            ),
                          ),

                          // Image pager
                          Expanded(
                            child: PageView.builder(
                              controller: pageController,
                              itemCount: imageAssets.length,
                              onPageChanged: (index) {
                                currentPage.value = index;
                              },
                              itemBuilder: (context, index) {
                                return Image.asset(
                                  imageAssets[index],
                                  scale: 4,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),

                          // Right arrow
                          GestureDetector(
                            onTap: () {
                              if (currentPage.value <
                                  imageAssets.length - 1) {
                                pageController.nextPage(
                                  duration:
                                  const Duration(milliseconds: 250),
                                  curve: Curves.easeOut,
                                );
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.77.w,
                                vertical: 8.52.h,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.normalBlue,
                              ),
                              child: Icon(
                                Icons.chevron_right,
                                color: AppColors.tsWhite,
                                size: 20.r,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 14.h),

                    // Dots indicator
                    Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(imageAssets.length, (index) {
                          final bool isActive =
                              currentPage.value == index;
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            width: 10.w,
                            height: 10.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isActive
                                  ? AppColors.normalBlue
                                  : AppColors.containerColor11,
                            ),
                          );
                        }),
                      );
                    }),
                  ],
                ),

                SizedBox(height: 59.h,),

                // Bottom "Next" button aligned to the right (like design)
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 169.w,
                    child: CustomButton(
                      padding: EdgeInsets.all(10.r),
                      color: AppColors.textColor1,
                      buttonContent: Center(
                        child: Text(
                          'Next',
                          style: h2.copyWith(
                            color: AppColors.normalBlue,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                      onTap: controller.goNext,
                    ),
                  ),
                ),

                SizedBox(height: 24.h,),
              ],
            ),
          ),
        );
      },
    );
  }
}
