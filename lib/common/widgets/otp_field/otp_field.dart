import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'otp_controller.dart';

class OtpField extends GetView<OtpController> {
  final double boxWidth;
  final double underlineThickness;
  final double spacing;

  const OtpField({
    super.key,
    this.boxWidth = 51.83,
    this.underlineThickness = 1,
    this.spacing = 6,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(controller.otpLength, (i) {
        final isFirst = i == 0;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing.w / 2),
          child: SizedBox(
            width: boxWidth.w,
            child: Focus(
              onKeyEvent: (node, evt) =>
                  controller.handleBackspaceOnEmpty(i, evt),
              child: TextField(
                focusNode: controller.focusNodes[i],
                controller: controller.controllers[i],
                autofocus: i == 0,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.tsWhite,
                  fontSize: 15.sp,
                ),
                cursorWidth: 1.6.w,
                cursorHeight: 15.h,
                decoration: InputDecoration(
                  counterText: '',
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.73.w, vertical: 15.h),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.textColor1,
                      width: underlineThickness,
                    ),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.textColor1,
                      width: underlineThickness,
                    ),
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(
                      isFirst ? controller.otpLength : 1),
                ],
                onChanged: (val) => controller.handleChange(i, val),
                onTap: () {
                  final c = controller.controllers[i];
                  c.selection = TextSelection(
                    baseOffset: 0,
                    extentOffset: c.text.length,
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
