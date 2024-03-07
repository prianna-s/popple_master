import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:popple/Constant/color_const.dart';

import '../../generated/assets.dart';
import '../../services/route_generator.dart';
import 'dashboard_controller.dart';

class DashboardPage extends GetView<DashboardController> {
  @override
  final controller = Get.put(DashboardController());

  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '0',
        onGenerateRoute: onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    Assets.svgExplre,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(primaryColorCode, BlendMode.srcIn),
                  ),
                  icon: SvgPicture.asset(
                    Assets.svgExplre,
                    colorFilter: const ColorFilter.mode(color_B8B7C7, BlendMode.srcIn),
                    width: 24,
                    height: 24,
                  ),
                  label: "Explore",
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    Assets.svgSaved,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(primaryColorCode, BlendMode.srcIn),
                  ),
                  icon: SvgPicture.asset(
                    Assets.svgSaved,
                    colorFilter: const ColorFilter.mode(color_B8B7C7, BlendMode.srcIn),
                    width: 24,
                    height: 24,
                  ),
                  label: "Saved",
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    Assets.svgGroup,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(primaryColorCode, BlendMode.srcIn),
                  ),
                  icon: SvgPicture.asset(
                    Assets.svgGroup,
                    colorFilter: const ColorFilter.mode(color_B8B7C7, BlendMode.srcIn),
                    width: 24,
                    height: 24,
                  ),
                  label: "Group",
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    Assets.svgProfile,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(primaryColorCode, BlendMode.srcIn),
                  ),
                  icon: SvgPicture.asset(
                    Assets.svgProfile,
                    colorFilter: const ColorFilter.mode(color_B8B7C7, BlendMode.srcIn),
                    width: 24,
                    height: 24,
                  ),
                  label: "Profile",
                ),
              ],
              currentIndex: controller.currentIndex.value,
              onTap: controller.changePage,
              backgroundColor: Colors.white,
              unselectedItemColor: color_B8B7C7,
              selectedItemColor: primaryColorCode,
              iconSize: 24,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              selectedLabelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
      ),
    );
  }
}
