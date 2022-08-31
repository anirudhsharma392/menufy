import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_maker/theme/theme.dart';

class AddButton extends StatelessWidget {
  final int count;
  final void Function() onAddition;
  final void Function() onSubtraction;
  final double width;
  final Color? primaryColor;
  final Color? secondaryColor;
  final bool isDarkShade;
  // final Color? primaryColor;
  // final Color? secondaryColor;
  const AddButton(
      {Key? key,
      this.count = 0,
      required this.onAddition,
      required this.onSubtraction,
      this.width = 90,
      this.primaryColor,
      this.secondaryColor,
      this.isDarkShade = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primary = primaryColor ?? Theme.of(context).primaryColor;
    final Color secondary = secondaryColor ?? AppColors.white;
    const double radius = 5;
    const double height = 32;
    return count == 0
        ? Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                border: Border.all(color: primary, width: 1),
                boxShadow: [AppStyle.shadow],
                borderRadius: BorderRadius.circular(radius)),
            child: Material(
              color: isDarkShade?primary:secondary,
              borderRadius: BorderRadius.circular(radius),
              child: InkWell(
                onTap: () => onAddition(),
                borderRadius: BorderRadius.circular(radius),
                splashColor: isDarkShade?secondary:primary,
                child: Center(
                  child: Text(
                    'ADD',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: isDarkShade?secondary:primary),
                  ),
                ),
              ),
            ),
          )
        : Container(
            height: height,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              border: Border.all(color: primary, width: 1),
              boxShadow: [AppStyle.shadow],
              color: isDarkShade ? primary : secondary,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onSubtraction,
                  child: Icon(
                    Icons.remove,
                    color: isDarkShade ? secondary : primary,
                    size: 18,
                  ),
                ),
                Text(
                  count.toString(),
                  style: TextStyle(
                      color: isDarkShade ? secondary : primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: onAddition,
                  child: Icon(
                    Icons.add,
                    color: isDarkShade ? secondary : primary,
                    size: 18,
                  ),
                )
              ],
            ),
          );
  }
}

class BottomButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? color;
  final String leading;
  final String trailing;
  const BottomButton(
      {Key? key,
      this.onTap,
      this.color,
      this.leading = '2 items  |  Rs 625',
      this.trailing = 'Next'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
        color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w600);
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xffe3e3e3),
          spreadRadius: 7,
          blurRadius: 5,
        )
      ]),
      child: Material(
        color: color ?? Theme.of(context).colorScheme.secondary,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 70,
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding
                  (
                    padding: EdgeInsets.only(left: AppStyle.margin),
                    child: Text(leading, style: style)),
                Row(
                  children: [
                    Text(trailing,
                        style:AppStyle.buttonStyle),
                    Icon(
                      Icons.arrow_right,
                      size: 26,
                      color: AppColors.white,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: AppStyle.borderRadius,
      onTap: () => Navigator.maybePop(context),
      child: Icon(
        CupertinoIcons.back,
        size: 30,
      ),
    );
  }
}
