import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:math' as math;

import 'package:get/get.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: HomeAppBar(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Query Topics
                Text(
                  'Query Topics',
                  style: h2.copyWith(
                    color: AppColors.tsWhite,
                    fontSize: 24.sp,
                  ),
                ),

                SizedBox(height: 16.h,),

                Row(
                  spacing: 13.w,
                  children: [
                    Expanded(
                      child: QueryTopicsCard(
                        icon: 'assets/images/home/check_booking_windows.svg',
                        title: 'Check Booking Windows',
                      ),
                    ),

                    Expanded(
                      child: QueryTopicsCard(
                        icon: 'assets/images/home/point_balance_exp.svg',
                        title: 'Point Balance & Exp.',
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24.h,),

                Row(
                  spacing: 13.w,
                  children: [
                    Expanded(
                      child: QueryTopicsCard(
                        icon: 'assets/images/home/maintenance_fees.svg',
                        title: 'Maintenance Fees',
                      ),
                    ),

                    Expanded(
                      child: QueryTopicsCard(
                        icon: 'assets/images/home/contract_analysis.svg',
                        title: 'Contract Analysis',
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40.h,),

                // Storage & Plan Usage
                Text(
                  'Storage & Plan Usage',
                  style: h2.copyWith(
                    color: AppColors.tsWhite,
                    fontSize: 24.sp,
                  ),
                ),

                SizedBox(height: 16.h,),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 9.39.h,),
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

                SizedBox(height: 16.h,),

                Row(
                  spacing: 24.w,
                  children: [
                    Expanded(
                      child: CustomButton(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h,),
                        color: AppColors.textColor1,
                        buttonContent: Center(
                          child: Text(
                            'Upload Files',
                            style: h2.copyWith(
                              color: AppColors.normalBlue,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        onTap: () {  },
                      ),
                    ),

                    Expanded(
                      child: CustomButton(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h,),
                        color: AppColors.tsTransparent,
                        border: Border.all(
                          color: AppColors.textColor1,
                        ),
                        buttonContent: Center(
                          child: Text(
                            'View Files',
                            style: h2.copyWith(
                              color: AppColors.tsWhite,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        onTap: () {  },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40.h,),

                Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    gradient: LinearGradient(
                      colors: AppColors.containerGradientColor2,
                    ),
                  ),
                  child: Column(
                    spacing: 16.h,
                    children: [
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Free ',
                                  style: h2.copyWith(
                                    color: AppColors.textColor1,
                                    fontSize: 24.sp,
                                  )
                              ),

                              TextSpan(
                                text: '14-Days',
                                style: h2.copyWith(
                                  color: AppColors.normalBlue,
                                  fontSize: 20.sp,
                                ),
                              ),

                              TextSpan(
                                  text: ' Trial',
                                  style: h2.copyWith(
                                    color: AppColors.textColor1,
                                    fontSize: 24.sp,
                                  )
                              ),
                            ]
                        ),
                      ),

                      Column(
                        spacing: 6.h,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '🎉',
                                style: h4.copyWith(
                                  color: AppColors.textColor8,
                                  fontSize: 30.sp,
                                ),
                              ),

                              Column(
                                spacing: 6.h,
                                children: [
                                  Text(
                                    'Upgrade to Gold Plan',
                                    style: h4.copyWith(
                                      color: AppColors.textColor9,
                                      fontSize: 18.sp,
                                    ),
                                  ),

                                  SizedBox(
                                    width: 239.w,
                                    child: Text(
                                      'Free testing of plus plan to get better experience and feel the difference between plans',
                                      style: h4.copyWith(
                                        color: AppColors.textColor1,
                                        fontSize: 12.sp,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),

                              Text(
                                '🎉',
                                style: h4.copyWith(
                                  color: AppColors.textColor8,
                                  fontSize: 30.sp,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(height: 40.h,),

                Text(
                  'Smart Alerts',
                  style: h2.copyWith(
                    color: AppColors.tsWhite,
                    fontSize: 24.sp,
                  ),
                ),

                SizedBox(height: 16.h,),

                Column(
                  spacing: 10.h,
                  children: [
                    SmartAlertsCard(
                      index: 0,
                      isActive: true,
                      title: 'Exchange Window Opening',
                      subtitle: 'High-demand week inventory opens Sep 15, 2025.',
                      isDeleteClicked: controller.isDeleteClicked,
                      DeleteClicked: controller.DeleteClicked,
                    ),

                    SmartAlertsCard(
                      index: 1,
                      isActive: false,
                      title: 'Exchange Window Opening',
                      subtitle: 'High-demand week inventory opens Sep 15, 2025.',
                      isDeleteClicked: controller.isDeleteClicked,
                      DeleteClicked: controller.DeleteClicked,
                    ),

                    SmartAlertsCard(
                      index: 2,
                      isActive: false,
                      title: 'Exchange Window Opening',
                      subtitle: 'High-demand week inventory opens Sep 15, 2025.',
                      isDeleteClicked: controller.isDeleteClicked,
                      DeleteClicked: controller.DeleteClicked,
                    ),
                  ],
                ),

                SizedBox(height: 20.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          'assets/images/onboarding/timeshare_secrets_logo_horizontal.svg',
          width: 90.w,
          height: 41.39.h,
        ),

        Text(
          'Good Morning',
          style: h3.copyWith(
            color: AppColors.tsWhite,
            fontSize: 16.sp,
          ),
        ),

        Row(
          spacing: 11.w,
          children: [
            GestureDetector(
              onTap: () {  },
              child: SvgPicture.asset(
                'assets/images/home/notifications.svg',
              ),
            ),

            GestureDetector(
              onTap: () {  },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.borderColor2,
                      width: 2.r,
                    )
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/home/home_profile.jpg'
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}


class QueryTopicsCard extends StatelessWidget {
  final String icon;
  final String title;

  const QueryTopicsCard({
    required this.icon,
    required this.title,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: AppColors.containerColor1,
        border: Border.all(
          color: AppColors.textColor1,
          width: 0.85.r,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
          ),
          SizedBox(width: 6.w),
          Expanded(
            child: Text(
              title,
              style: h4.copyWith(
                color: AppColors.textColor6,
                fontSize: 12.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}


class StoragePlanCard extends StatelessWidget {
  final String title;
  final double? width;

  const StoragePlanCard({
    required this.title,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // dynamic width
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        color: AppColors.tsWhite,
        border: Border.all(
          color: AppColors.textColor1,
          width: 0.5.r,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: h4.copyWith(
          color: AppColors.tsGray,
          fontSize: 10.sp,
        ),
      ),
    );
  }
}


class StoragePlanChipsGrid extends StatelessWidget {
  final List<String> titles;
  final int preferredColumns;
  final double rowSpacing;
  final double colSpacing;

  const StoragePlanChipsGrid({
    super.key,
    required this.titles,
    this.preferredColumns = 2,
    this.rowSpacing = 10,
    this.colSpacing = 10,
  });

  double _measureTextWidth(String text, TextStyle style) {
    final tp = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout(maxWidth: double.infinity);
    return tp.size.width;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = h4.copyWith(color: AppColors.tsGray, fontSize: 10.sp);
    final maxLabel = titles.fold<double>(
      0,
          (maxW, t) => math.max(maxW, _measureTextWidth(t, textStyle)),
    );

    // chip horizontal extras
    final horizontalPadding = 10.r * 2;
    final horizontalBorder = 0.5.r * 2;
    final neededChipWidth = maxLabel + horizontalPadding + horizontalBorder;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Try preferredColumns first; if it doesn't fit, fall back to fewer columns.
        int cols = preferredColumns.clamp(1, titles.length);
        double chipWidth;

        while (true) {
          final totalSpacing = (cols - 1) * colSpacing.w;
          final perColWidth = (constraints.maxWidth - totalSpacing) / cols;
          chipWidth = math.min(neededChipWidth, perColWidth);

          // If the needed width is larger than what fits per column,
          // try reducing columns; stop at 1.
          if (neededChipWidth > perColWidth && cols > 1) {
            cols--;
            continue;
          }
          break;
        }

        // Build rows with `cols` items per row
        final rows = <Widget>[];
        for (int i = 0; i < titles.length; i += cols) {
          final slice = titles.sublist(i, math.min(i + cols, titles.length));
          rows.add(Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int j = 0; j < slice.length; j++) ...[
                StoragePlanCard(title: slice[j], width: chipWidth),
                if (j != slice.length - 1) SizedBox(width: colSpacing.w),
              ],
            ],
          ));
          if (i + cols < titles.length) rows.add(SizedBox(height: rowSpacing.h));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rows,
        );
      },
    );
  }
}


class SmartAlertsCard extends StatelessWidget {
  final int index;
  final bool isActive;
  final String title;
  final String subtitle;
  final RxList<RxBool> isDeleteClicked;
  final void Function(int) DeleteClicked;

  const SmartAlertsCard({
    required this.index,
    required this.isActive,
    required this.title,
    required this.subtitle,
    required this.isDeleteClicked,
    required this.DeleteClicked,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: AppColors.tsWhite.withAlpha(26),
              border: Border(
                left: BorderSide(
                  color: isActive ? AppColors.textColor1 : AppColors.tsWhite,
                  width: 2.5.w,
                ),
              ),
            ),
            child: Row(
              children: [
                Row(
                  spacing: 10.w,
                  children: [
                    SvgPicture.asset(
                      'assets/images/home/smart_alerts_active_icon.svg',
                      color: isActive ? AppColors.textColor1 : AppColors.tsWhite,
                    ),

                    Column(
                      spacing: 4.h,
                      crossAxisAlignment: CrossAxisAlignment
                          .start,
                      children: [
                        Text(
                          title,
                          style: h3.copyWith(
                            color: AppColors.tsWhite,
                            fontSize: 12.sp,
                          ),
                        ),

                        Text(
                          subtitle,
                          style: h4.copyWith(
                            color: AppColors.textColor1,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    DeleteClicked(index);
                  },
                  child: SvgPicture.asset(
                    'assets/images/home/more_options.svg',
                  ),
                )
              ],
            ),
          ),

          if (isDeleteClicked[index].value)
            Positioned(
              right: 0.w,
              bottom: -10.h,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w, vertical: 6.h,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: AppColors.tsWhite,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.tsBlack.withAlpha(40),
                      blurRadius: 4.r,
                      offset: Offset(0.w, 4.h),
                    ),
                  ],
                ),
                child: Text(
                  'Delete',
                  style: h4.copyWith(
                    color: AppColors.tsBlack,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }
}


// Add this widget (paste near the bottom of your file or in a new file)
class CircularDonut extends StatelessWidget {
  /// [value] between 0.0 and 1.0 (e.g. 0.26 for 26%)
  final double value;
  final double size; // outer diameter
  final Color backgroundRing;
  final Color foregroundArc;
  final double strokeWidth;
  final TextStyle percentStyle;
  final TextStyle remainingStyle;
  final String remainingText;

  const CircularDonut({
    super.key,
    required this.value,
    this.size = 120,
    this.backgroundRing = const Color(0xFFE0E2E1), // pale grey ring
    this.foregroundArc = const Color(0xFF0F2B3C), // navy arc
    this.strokeWidth = 18.0,
    required this.percentStyle,
    required this.remainingStyle,
    required this.remainingText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CustomPaint(
              painter: _DonutPainter(
                value: value.clamp(0.0, 1.0),
                backgroundColor: backgroundRing,
                foregroundColor: foregroundArc,
                strokeWidth: strokeWidth,
              ),
              child: Center(
                child: Text(
                  '${(value * 100).round()}%',
                  style: percentStyle,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            remainingText,
            style: remainingStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _DonutPainter extends CustomPainter {
  final double value;
  final Color backgroundColor;
  final Color foregroundColor;
  final double strokeWidth;

  _DonutPainter({
    required this.value,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (math.min(size.width, size.height) - strokeWidth) / 2;

    final bgPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt
      ..color = backgroundColor;

    canvas.drawCircle(center, radius, bgPaint);

    // Foreground arc (rounded caps)
    final fgPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = foregroundColor;

    final startAngle = -math.pi / 2; // start at top
    final sweepAngle = 2 * math.pi * value;

    // draw arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      fgPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _DonutPainter old) {
    return old.value != value ||
        old.backgroundColor != backgroundColor ||
        old.foregroundColor != foregroundColor ||
        old.strokeWidth != strokeWidth;
  }
}
