import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menufy_partner/generated/assets.dart';
import 'package:menufy_partner/theme/theme.dart';
import 'package:menufy_partner/view/home/home_controller.dart';
import 'package:menufy_partner/view/home/home_view/app_bar.dart';
import 'package:menufy_partner/view/home/home_view/order_card.dart';
import 'package:menufy_partner/widgets/common.dart';

class HomePage extends GetView<HomeController> {
  static const route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: const Body(),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              _getNavBarItem(
                Assets.iconsOrders,
                "Orders",
              ),
              _getNavBarItem(
                Assets.iconsHistory,
                "History",
              ),
              _getNavBarItem(
                Assets.iconsMenu,
                "Menu",
              ),
              _getNavBarItem(
                Assets.iconsSetting,
                "Settings",
              ),
            ],
            currentIndex: controller.selectedTab.value,
            selectedItemColor: AppColors.black,
            type: BottomNavigationBarType.fixed,
            onTap: controller.onTabChange,
          ),
        ));
  }

  BottomNavigationBarItem _getNavBarItem(image, label) =>
      BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(2),
            child: Image.asset(
              image,
              height: 24,
              color: AppColors.disabled,
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.all(2),
            child: Image.asset(
              image,
              height: 24,
              color: AppColors.black,
            ),
          ),
          label: label,
          backgroundColor: Colors.red);
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderAppBar(),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (bc, i) => OrderCard()),
        )
      ],
    );
  }
}
