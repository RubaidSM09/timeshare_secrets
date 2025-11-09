import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';

import '../controllers/set_profile_docs_controller.dart';
import 'step_1_view.dart';

class SetProfileDocsView extends GetView<SetProfileDocsController> {
  const SetProfileDocsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SetProfileDocsController());

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              SizedBox(height: 53.h),

              SvgPicture.asset(
                'assets/images/onboarding/timeshare_secrets_logo_horizontal.svg',
              ),

              SizedBox(height: 27.h),

              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                    color: AppColors.tsWhite,
                  ),

                  // ── WELCOME vs STEP FLOW ────────────────────────────────
                  child: controller.isClicked.isFalse
                      ? const Step1View()
                      : Column(
                    children: [
                      SizedBox(height: 12.h),

                      Text(
                        'To smooth the usage of Timeshsare Genie\nComplete the steps',
                        style: h4.copyWith(
                          color: AppColors.textColor1,
                          fontSize: 14.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 10.h),

                      // Step X of Y
                      Obx(() {
                        return StepTracker(
                          current: controller.currentStep.value + 1,
                          total: controller.totalSteps,
                        );
                      }),

                      SizedBox(height: 12.h),

                      // Progress bars row
                      StepTrackerBarRow(
                        stepTracker: controller.stepTracker,
                      ),

                      SizedBox(height: 12.h),

                      // PageView with all steps (position of tracker is fixed)
                      Expanded(
                        child: PageView.builder(
                          controller: controller.pageController,
                          physics: const BouncingScrollPhysics(),
                          onPageChanged: controller.onPageChanged,
                          itemCount: controller.totalSteps,
                          itemBuilder: (context, index) {
                            return controller.buildStepPage(index);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

// ───────────────── STEP TRACKER WIDGETS ─────────────────

class StepTracker extends StatelessWidget {
  final int current;
  final int total;

  const StepTracker({
    required this.current,
    required this.total,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Step $current',
          style: h2.copyWith(
            color: AppColors.normalBlue,
            fontSize: 16.sp,
          ),
        ),
        Text(
          ' of $total',
          style: h3.copyWith(
            color: AppColors.tsGray,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}

class StepTrackerBarRow extends StatelessWidget {
  final RxList<RxBool> stepTracker;

  const StepTrackerBarRow({
    required this.stepTracker,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 6.w,
        children: stepTracker.map((step) {
          return StepTrackerBar(isPassed: step);
        }).toList(),
      );
    });
  }
}

class StepTrackerBar extends StatelessWidget {
  final RxBool isPassed;

  const StepTrackerBar({
    required this.isPassed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 8.h,
        width: 32.5.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9999.r),
          color: isPassed.value
              ? AppColors.containerColor8
              : AppColors.containerColor9,
        ),
      );
    });
  }
}
