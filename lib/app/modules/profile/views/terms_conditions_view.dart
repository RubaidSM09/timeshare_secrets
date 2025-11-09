import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/profile/views/settings_view.dart';
import 'package:timeshare_secrets/common/app_colors.dart';

import '../../../../common/custom_fonts.dart';

class TermsConditionsView extends GetView {
  const TermsConditionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SettingsAppBar(appBarText: 'Terms & Conditions',),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 25.h,),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 20.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.containerColor3,
                  ),
                  child: Column(
                    children: [
                      TermsConditionsPrivacyPolicyPoint(
                        text: 'Lorem ipsum dolor sit amet consectetur. Lacus at venenatis gravida vivamus mauris. Quisque mi est vel dis. Donec rhoncus laoreet odio orci sed risus elit accumsan. Mattis ut est tristique amet vitae at aliquet. Ac vel porttitor egestas scelerisque enim quisque senectus. Euismod ultricies vulputate id cras bibendum sollicitudin proin odio bibendum. Velit velit in scelerisque erat etiam rutrum phasellus nunc. Sed lectus sed a at et eget. Nunc purus sed quis at risus. Consectetur nibh justo proin placerat condimentum id at adipiscing.',
                      ),

                      TermsConditionsPrivacyPolicyPoint(
                        text: 'Vel blandit mi nulla sodales consectetur. Egestas tristique ultrices gravida duis nisl odio. Posuere curabitur eu platea pellentesque ut. Facilisi elementum neque mauris facilisis in. Cursus condimentum ipsum pretium consequat turpis at porttitor nisi.',
                      ),

                      TermsConditionsPrivacyPolicyPoint(
                        text: 'Scelerisque tellus praesent condimentum euismod a faucibus. Auctor at ultricies at urna aliquam massa pellentesque. Vitae vulputate nullam diam placerat m.',
                      ),

                      TermsConditionsPrivacyPolicyPoint(
                        text: 'Scelerisque tellus praesent condimentum euismod a faucibus. Auctor at ultricies at urna aliquam massa pellentesque. Vitae vulputate nullam diam placerat m.',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class TermsConditionsPrivacyPolicyPoint extends StatelessWidget {
  final String text;

  const TermsConditionsPrivacyPolicyPoint({
    required this.text,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '•',
          style: h4.copyWith(
            color: AppColors.borderColor3,
            fontSize: 14.sp,
          ),
        ),

        SizedBox(
          width: 290.w,
          child: Text(
            text,
            style: h4.copyWith(
              color: AppColors.borderColor3,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}