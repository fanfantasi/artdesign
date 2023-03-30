import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:artdesign/app/core/widgets/sidebar.dart';
import 'package:artdesign/app/presentation/event/event_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_view.dart';
import 'dashboard_controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: controller.onWillPop,
        child: Scaffold(
          key: controller.scaffoldKey,
          drawer: const SideBar(),
          body: Obx(() => activeScreen()),
          bottomNavigationBar: Obx(() => _bottonNavigationBar(context)),
        ));
  }

  Widget activeScreen() {
    switch (controller.selectedIndex.value) {
      case 0:
        return const HomeView();
      case 1:
        return const HomeView();
      case 2:
        return const HomeView();
      case 3:
        return const EventView(
          page: true,
        );
      case 4:
        return const HomeView();
      default:
        return const HomeView();
    }
  }

  AnimatedBottomNavigationBar _bottonNavigationBar(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: controller.iconList.length,
      tabBuilder: (int index, bool isActive) {
        final color = isActive
            ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
            : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor;

        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              controller.iconList[index],
              color: color,
              width: 24,
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                controller.textList[index],
                style: TextStyle(color: color, fontSize: 14),
              ),
            )
          ],
        );
      },
      gapLocation: GapLocation.none,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      activeIndex: controller.selectedIndex.value,
      splashSpeedInMilliseconds: 200,
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      splashColor: Theme.of(context).primaryColor,
      onTap: (index) => controller.onMenuTapped(index),
    );
  }
}
