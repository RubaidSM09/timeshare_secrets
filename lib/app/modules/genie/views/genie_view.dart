import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';
import 'package:timeshare_secrets/common/widgets/custom_text_fields.dart';

import '../controllers/genie_controller.dart';

class GenieView extends GetView<GenieController> {
  const GenieView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(GenieController());

    return Scaffold(
      backgroundColor: AppColors.tsWhite,
      body: SafeArea(
        child: Obx(() {
          return Stack(
            children: [
              Positioned(
                top: 83.h,
                child: Stack(
                  children: [
                    Container(
                      // width: double.infinity,
                      height: 607.5.h,
                      padding: EdgeInsets.all(20.r),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GenieMessage(
                              text: 'Hello! I\'m your Timeshare Genie. How can I help you today?',
                              time: '10:30 Am',
                            ),

                            controller.isMessageClicked.value ? Column(
                              spacing: 43.h,
                              children: [
                                SizedBox.shrink(),

                                UserMessage(
                                  text: 'Check my files',
                                  time: '10:31 Am',
                                ),

                                GenieMessage(
                                  text: 'Analyzing....',
                                  time: '10:32 Am',
                                ),
                              ],
                            ) : Column(
                              children: [
                                SizedBox(height: 270.h,),

                                Column(
                                  spacing: 16.h,
                                  children: [
                                    Text(
                                      'Questions You Can Ask:',
                                      style: h4.copyWith(
                                        color: AppColors.textColor1,
                                        fontSize: 16.sp,
                                      ),
                                    ),

                                    QuestionCard(
                                      question: 'How can I get out of my timeshare?',
                                      onTap: () {
                                        controller.isMessageClicked.value = true;
                                      },
                                    ),

                                    QuestionCard(
                                      question: 'I don\'t understand my ownership',
                                      onTap: () {
                                        controller.isMessageClicked.value = true;
                                      },
                                    ),

                                    QuestionCard(
                                      question: 'Explore My Options',
                                      onTap: () {
                                        controller.isMessageClicked.value = true;
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    if (controller.isVoiceClicked.value)
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.zero,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 5,
                              sigmaY: 5,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: AppColors.tsBlur.withAlpha(64),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 22.h,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(29.r),
                                      decoration: BoxDecoration(
                                        color: AppColors.normalBlue,
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/images/genie/listening.svg',
                                      ),
                                    ),

                                    Text(
                                      'Listening',
                                      style: h3.copyWith(
                                        color: AppColors.normalBlue,
                                        fontSize: 23.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              Positioned(
                top: 0.h,
                left: 0.w,
                right: 0.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w, vertical: 26.h,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12.r),
                      bottomLeft: Radius.circular(12.r),
                    ),
                    color: AppColors.normalBlue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          padding: EdgeInsets.all(6.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.tsWhite,
                            border: Border.all(
                              color: AppColors.tsWhite,
                              width: 0.5.r,
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            size: 16.r,
                            color: AppColors.tsBlue,
                          ),
                        ),
                      ),

                      Row(
                        spacing: 12.w,
                        children: [
                          Container(
                            padding: EdgeInsets.all(6.r),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.textColor1,
                              border: Border.all(
                                color: AppColors.tsWhite,
                                width: 0.45.r,
                              ),
                            ),
                            child: SvgPicture.asset(
                              'assets/images/genie/genie.svg',
                            ),
                          ),

                          Text(
                            'Timeshare Genie',
                            style: h3.copyWith(
                              color: AppColors.tsWhite,
                              fontSize: 20.sp,
                            ),
                          )
                        ],
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w,
                          vertical: 6.h,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          border: Border.all(
                            color: AppColors.borderColor5,
                          ),
                        ),
                        child: Row(
                          spacing: 6.w,
                          children: [
                            Text(
                              'Default',
                              style: h4.copyWith(
                                color: AppColors.tsWhite,
                                fontSize: 10.sp,
                              ),
                            ),

                            SvgPicture.asset(
                              'assets/images/genie/global.svg',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: 0.h,
                left: 0.w,
                right: 0.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w, vertical: 14.h,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.r),
                      topLeft: Radius.circular(12.r),
                    ),
                    color: AppColors.normalBlue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.isVoiceClicked.value = !controller.isVoiceClicked.value;
                        },
                        child: SvgPicture.asset(
                          'assets/images/genie/voice.svg',
                        ),
                      ),

                      CustomTextFields(
                        hintText: 'Type Your Message',
                        hintTextColor: AppColors.textColor16,
                        width: 297.w,
                        borderRadius: 100.r,
                        padding: EdgeInsets.symmetric(
                          horizontal: 21.87.w,
                          vertical: 15.h,
                        ),
                        color: AppColors.tsWhite,
                        isObscureText: false.obs,
                      ),

                      GestureDetector(
                        onTap: () {  },
                        child: SvgPicture.asset(
                          'assets/images/genie/send.svg',
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


class GenieMessage extends StatelessWidget {
  final String text;
  final String time;

  const GenieMessage({
    required this.text,
    required this.time,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.w,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(7.87.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.textColor1,
            border: Border.all(
              color: AppColors.tsWhite,
              width: 0.45.r,
            ),
          ),
          child: SvgPicture.asset(
            'assets/images/genie/genie.svg',
          ),
        ),

        Container(
          width: 318.w,
          padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 11.h,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r),
            ),
            color: AppColors.containerColor6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 9.w,
            children: [
              Text(
                text,
                style: h4.copyWith(
                  color: AppColors.textColor17,
                  fontSize: 14.sp,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    time,
                    style: h4.copyWith(
                      color: AppColors.textColor18,
                      fontSize: 9.44.sp,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}


class UserMessage extends StatelessWidget {
  final String text;
  final String time;

  const UserMessage({
    required this.text,
    required this.time,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.w,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(width: 32.w,),

        Container(
          width: 318.w,
          padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 11.h,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
              bottomLeft: Radius.circular(16.r),
            ),
            color: AppColors.containerColor7,
          ),
          child: Column(
            spacing: 9.w,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                text,
                style: h4.copyWith(
                  color: AppColors.textColor17,
                  fontSize: 14.sp,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: h4.copyWith(
                      color: AppColors.textColor18,
                      fontSize: 9.44.sp,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}


class QuestionCard extends StatelessWidget {
  final String question;
  final void Function()? onTap;

  const QuestionCard({
    required this.question,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.containerColor1,
          border: Border.all(
            color: AppColors.textColor1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              question,
              style: h4.copyWith(
                color: AppColors.tsBlack,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
