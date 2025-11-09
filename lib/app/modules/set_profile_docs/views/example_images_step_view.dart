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
      'assets/images/set_profile_docs/example_2.png',
      'assets/images/set_profile_docs/example_3.png',
      'assets/images/set_profile_docs/example_4.png',
      'assets/images/set_profile_docs/example_5.png',
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top spacer (keeps layout similar to design)
                  const SizedBox.shrink(),

                  // Center content: title + carousel + dots
                  Column(
                    children: [
                      Text(
                        'Examples Images that you need to\nupload for profile set up.',
                        style: h2.copyWith(
                          color: AppColors.normalBlue,
                          fontSize: 22.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 28.h),

                      SizedBox(
                        height: 420.h,
                        child: Row(
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
                                width: 40.r,
                                height: 40.r,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.normalBlue,
                                ),
                                child: Icon(
                                  Icons.chevron_left,
                                  color: AppColors.tsWhite,
                                  size: 26.r,
                                ),
                              ),
                            ),

                            SizedBox(width: 16.w),

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
                                    fit: BoxFit.contain,
                                  );
                                },
                              ),
                            ),

                            SizedBox(width: 16.w),

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
                                width: 40.r,
                                height: 40.r,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.normalBlue,
                                ),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: AppColors.tsWhite,
                                  size: 26.r,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Dots indicator
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(imageAssets.length, (index) {
                            final bool isActive =
                                currentPage.value == index;
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              width: isActive ? 10.r : 8.r,
                              height: isActive ? 10.r : 8.r,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isActive
                                    ? AppColors.normalBlue
                                    : AppColors.containerColor9,
                              ),
                            );
                          }),
                        );
                      }),
                    ],
                  ),

                  // Bottom "Next" button aligned to the right (like design)
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 170.w,
                      child: CustomButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.h,
                        ),
                        color: AppColors.textColor1,
                        buttonContent: Center(
                          child: Text(
                            'Next',
                            style: h2.copyWith(
                              color: AppColors.normalBlue,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        onTap: controller.goNext,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
