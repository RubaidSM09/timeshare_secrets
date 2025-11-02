import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_fonts.dart';
import '../../../../common/widgets/custom_button.dart';

class Step1View extends GetView {
  const Step1View({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox.shrink(),

                  Column(
                    children: [
                      SvgPicture.asset(
                          'assets/images/set_profile_docs/timeshare_genie.svg'
                      ),

                      SizedBox(height: 20.h,),

                      Text(
                        'Welcome to Your\nTimeshare Genie',
                        style: h2.copyWith(
                          color: AppColors.normalBlue,
                          fontSize: 28.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 8.h,),

                      Text(
                        'Let\'s personalize your experience so Genie can \nserve as your trusted advisor.',
                        style: h4.copyWith(
                          color: AppColors.tsGray,
                          fontSize: 14.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  SizedBox.shrink(),

                  Column(
                    children: [
                      CustomButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.w,
                          vertical: 10.h,
                        ),
                        color: AppColors.textColor1,
                        buttonContent: Row(
                          spacing: 10.w,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/images/set_profile_docs/documents.svg'
                            ),

                            Text(
                              'Continue With Documents',
                              style: h2.copyWith(
                                color: AppColors.normalBlue,
                                fontSize: 18.sp,
                              ),
                            )
                          ],
                        ),
                        onTap: (){  },
                      ),

                      SizedBox(height: 16.h,),

                      CustomButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.w,
                          vertical: 10.h,
                        ),
                        color: AppColors.normalBlue,
                        buttonContent: Row(
                          spacing: 10.w,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/images/set_profile_docs/images.svg'
                            ),

                            Text(
                              'Continue with Images',
                              style: h2.copyWith(
                                color: AppColors.tsWhite,
                                fontSize: 18.sp,
                              ),
                            )
                          ],
                        ),
                        onTap: (){  },
                      ),

                      SizedBox(height: 16.h,),

                      Text(
                        'Note : Choose a Preferred to Way to Continue',
                        style: h3.copyWith(
                          color: AppColors.textColor1,
                          fontSize: 14.sp,
                        ),
                      ),

                      SizedBox(height: 14.h,),
                    ],
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
