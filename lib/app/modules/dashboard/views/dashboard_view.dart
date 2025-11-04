import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:timeshare_secrets/app/modules/genie/views/genie_view.dart';
import 'package:timeshare_secrets/app/modules/vault/views/vault_view.dart';

import '../../../../common/widgets/custom_navigation_bar.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    final List<Widget> pages = [
      HomeView(),
      VaultView(),
      GenieView(),
      ProfileView()
    ];

    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),

      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
