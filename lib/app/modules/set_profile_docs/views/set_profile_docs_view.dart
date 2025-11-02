import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/set_profile_docs/views/step_1_view.dart';
import 'package:timeshare_secrets/app/modules/set_profile_docs/views/step_2_view.dart';
import 'package:timeshare_secrets/app/modules/set_profile_docs/views/step_3_view.dart';
import 'package:timeshare_secrets/common/app_colors.dart';
import 'package:timeshare_secrets/common/custom_fonts.dart';
import 'package:timeshare_secrets/common/widgets/custom_button.dart';

import '../controllers/set_profile_docs_controller.dart';

class SetProfileDocsView extends GetView<SetProfileDocsController> {
  const SetProfileDocsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 53.h,),

            SvgPicture.asset(
                'assets/images/onboarding/timeshare_secrets_logo_horizontal.svg'
            ),

            SizedBox(height: 27.h,),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r),),
                  color: AppColors.tsWhite,
                ),
                child: PageView(
                  children: [
                    Step1View(),
                    Step2View(),
                    Step3View(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
