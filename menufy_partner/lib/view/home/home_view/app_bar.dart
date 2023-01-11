import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menufy_partner/theme/theme.dart';
import 'package:menufy_partner/view/home/home_controller.dart';
import 'package:menufy_partner/widgets/common.dart';

class OrderAppBar extends GetView<HomeController> {
  const OrderAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double topPadding = max(MediaQuery.of(context).padding.top, 32);

    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          Padding(
            padding: AppStyle.horizontalPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Space(
                  height: topPadding,
                ),
                Row(
                  children: [
                    Obx(
                      () => OnlineButton(
                        isOnline: controller.isOnline.value,
                        onTap: controller.onOnlineChange,
                      ),
                    ),
                    const Spacer(),
                    const Text("McDonald's", style: AppStyle.headLine1),
                    const SpaceHorizontal(),
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/512/732/732217.png',
                      height: 30,
                    )
                  ],
                ),
                const Space(),
                Row(
                  children: const [
                    ToggleOption(
                      isSelected: true,
                      title: "Preparing",
                      count: 6,
                    ),
                    ToggleOption(
                      isSelected: false,
                      title: "Ready",
                      count: 2,
                    ),
                    ToggleOption(
                      isSelected: false,
                      title: "Delivering",
                      count: 3,
                    ),
                  ],
                ),
                const Space(),
              ],
            ),
          ),
          const CustomDivider()
        ],
      ),
    );
  }
}

class ToggleOption extends StatelessWidget {
  final bool isSelected;
  final String title;
  final int count;
  const ToggleOption(
      {Key? key,
      required this.isSelected,
      required this.title,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = isSelected
        ? Theme.of(context).primaryColor
        : Theme.of(context).disabledColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: selectedColor,
          width: 1,
        ),
        borderRadius: AppStyle.borderRadius,
      ),
      child: Text(
        count > 0 ? "$title ($count)" : title,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
            color: selectedColor,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400),
      ),
    );
  }
}

class OnlineButton extends StatelessWidget {
  final bool isOnline;
  final void Function() onTap;
  const OnlineButton({Key? key, required this.isOnline, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(
        fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white);
    final Color color = isOnline ? AppColors.success : AppColors.error;
    const double height = 35;
    const double margin = 5;
    const double buttonSize = height - (2 * margin);

    return SizedBox(
      width: 95,
      child: AnimatedToggleSwitch<bool>.dual(
        current: isOnline,
        first: false,
        second: true,
        dif: 0.0,
        borderColor: color,
        innerColor: color,
        indicatorColor: Colors.white,
        borderWidth: margin,
        indicatorSize: const Size(buttonSize, buttonSize),
        height: height,
        onChanged: (b) {
          onTap();
        },
        loading: false,
        textBuilder: (value) => value
            ? const Center(child: Text('Online', style: style))
            : const Center(child: Text('Offline', style: style)),
      ),
    );
  }
}
