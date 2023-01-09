import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menufy_partner/generated/assets.dart';
import 'package:menufy_partner/theme/theme.dart';
import 'package:menufy_partner/view/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  static const route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const Text("Home screen"),
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
          padding:const EdgeInsets.all(2),
          child: Image.asset(
            image,
            height: 24,
            color: AppColors.black,
          ),
        ),
        label: label,backgroundColor: Colors.red
      );
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text("McDonald's", style: AppStyle.headLine1),
          Image.network(
            'https://cdn-icons-png.flaticon.com/512/732/732217.png',
            height: 30,
          )
        ],
      ),
    );
  }
}
