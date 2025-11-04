import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/vault/views/delete_from_uploaded_list_view.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/custom_fonts.dart';
import '../controllers/vault_controller.dart';

class VaultView extends GetView<VaultController> {
  const VaultView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: VaultAppBar(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Upload Documents
                Text(
                  'Upload Documents',
                  style: h2.copyWith(
                    color: AppColors.tsWhite,
                    fontSize: 24.sp,
                  ),
                ),

                SizedBox(height: 16.h,),

                Text(
                  'Store and organize your timeshare documents',
                  style: h4.copyWith(
                    color: AppColors.textColor1,
                    fontSize: 14.sp,
                  ),
                ),

                SizedBox(height: 16.h,),

                GestureDetector(
                  onTap: () {  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.tsWhite.withAlpha(26),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: DottedBorder(
                        options: RectDottedBorderOptions(
                          dashPattern: [2.5.w, 2.5.h],
                          strokeWidth: 4.r,
                          color: AppColors.textColor1,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 48.w,
                            vertical: 34.h,
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'assets/images/vault/upload.svg',
                              ),

                              SizedBox(height: 8.h,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Drag and drop files here, or click to browse',
                                    style: h4.copyWith(
                                      color: AppColors.tsWhite,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 5.h,),

                              Text(
                                'Supports PDF, JPG, PNG',
                                style: h4.copyWith(
                                  color: AppColors.tsWhite,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 40.h,),

                // Uploaded Documents List
                Column(
                  spacing: 16.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      spacing: 16.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Uploaded Documents List',
                          style: h2.copyWith(
                            color: AppColors.tsWhite,
                            fontSize: 24.sp,
                          ),
                        ),

                        Text(
                          'View and delete your files',
                          style: h4.copyWith(
                            color: AppColors.textColor1,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),

                    UploadedDocumentCard(
                      name: 'Details2.doc',
                      size: '1.2 MB',
                      date: ' 2025-08-12',
                    ),

                    UploadedDocumentCard(
                      name: 'Details2.doc',
                      size: '1.2 MB',
                      date: ' 2025-08-12',
                    ),

                    UploadedDocumentCard(
                      name: 'Details2.doc',
                      size: '1.2 MB',
                      date: ' 2025-08-12',
                    ),

                    UploadedDocumentCard(
                      name: 'Details2.doc',
                      size: '1.2 MB',
                      date: ' 2025-08-12',
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


class VaultAppBar extends StatelessWidget {
  const VaultAppBar({super.key});

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
    );
  }
}


class UploadedDocumentCard extends StatelessWidget {
  final String name;
  final String size;
  final String date;

  const UploadedDocumentCard({
    required this.name,
    required this.size,
    required this.date,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 18.h,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.tsWhite.withAlpha(38),
          border: Border.all(
            color: AppColors.textColor1,
            width: 0.45.r,
          )
      ),
      child: Row(
        spacing: 12.w,
        children: [
          SvgPicture.asset(
            'assets/images/vault/document.svg',
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  spacing: 16.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 12.w,
                      children: [
                        Text(
                          name,
                          style: h4.copyWith(
                            color: AppColors.tsWhite,
                            fontSize: 18.sp,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {  },
                          child: SvgPicture.asset(
                            'assets/images/vault/edit.svg',
                          ),
                        ),
                      ],
                    ),

                    Text(
                      size,
                      style: h4.copyWith(
                        color: AppColors.textColor11,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),

                Column(
                  spacing: 16.h,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      spacing: 18.w,
                      children: [
                        GestureDetector(
                          onTap: () {  },
                          child: SvgPicture.asset(
                            'assets/images/vault/view.svg',
                          ),
                        ),

                        GestureDetector(
                          onTap: () => Get.dialog(DeleteFromUploadedListView()),
                          child: SvgPicture.asset(
                            'assets/images/vault/delete.svg',
                          ),
                        ),
                      ],
                    ),

                    Text(
                      date,
                      style: h4.copyWith(
                        color: AppColors.textColor11,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
