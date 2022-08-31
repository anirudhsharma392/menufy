import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_maker/theme/theme.dart';
import 'package:menu_maker/utils/animations.dart';
import 'package:menu_maker/widgets/common.dart';

class HoverMenu extends StatefulWidget {
  const HoverMenu({Key? key}) : super(key: key);

  @override
  State<HoverMenu> createState() => _HoverMenuState();
}

class _HoverMenuState extends State<HoverMenu> {
  bool _isExpanded = false;

  _onExpand() => setState(() {
        _isExpanded = !_isExpanded;
      });

  final count = 12;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ExpandedSection(
            isExpanded: _isExpanded,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    alignment: Alignment.centerRight,
                    width: 300,
                    height: 350,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius:
                            BorderRadius.circular(AppStyle.radius )),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: count,
                        itemBuilder: (bc, i) => Padding(
                            padding: EdgeInsets.only(
                                top: i == 0 ? 24 : 0,
                                bottom: i == count ? 24 : 0),
                            child: MenuItem()))),
              ],
            ),
          ),
          const Space(),
          MenuButton(
            onTap: () => _onExpand(),
            showClose: _isExpanded,
          )
          //CloseButton(onTap: () => _onExpand()),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(fontSize: 15, color: AppColors.white);
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Big burgers",
            style: style,
          ),
          Text('12', style: style)
        ],
      ),
    );
  }
}

class CloseButton extends StatelessWidget {
  final void Function()? onTap;
  const CloseButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        padding: AppStyle.horizontalPadding,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [AppStyle.shadow],
          color: AppColors.black,
        ),
        child: Icon(
          CupertinoIcons.clear,
          color: AppColors.white,
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final void Function()? onTap;
  final bool showClose;
  const MenuButton({Key? key, required this.onTap, this.showClose = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        padding: AppStyle.horizontalPadding,
        decoration: BoxDecoration(
          boxShadow: [AppStyle.shadow],
          borderRadius: BorderRadius.circular(AppStyle.radius ),
          color: showClose ? Colors.red : AppColors.black,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              showClose ? Icons.clear : Icons.restaurant_menu_rounded,
              color: AppColors.white,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              showClose ? "Close" : "Menu",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
