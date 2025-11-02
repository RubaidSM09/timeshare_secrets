import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/core/dependency_injection.dart';
import 'app/routes/app_pages.dart';
import 'common/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    setupDependencies();
  runApp(
    ScreenUtilInit(
        designSize: const Size(402, 874), // Set your design size (e.g., based on your design mockup)
        minTextAdapt: true, // Allows text to scale adaptively
        splitScreenMode: true, // Supports split-screen mode
        builder: (context, child) {
          return GetMaterialApp(
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.rightToLeft,
            transitionDuration: Duration(milliseconds: 300),
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.normalBlue,

              appBarTheme: AppBarTheme(
                backgroundColor: AppColors.normalBlue,
                foregroundColor: AppColors.tsWhite,
              ),
            ),
          );
        },
    ),
  );
  });
}
