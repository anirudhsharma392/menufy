import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menufy_partner/theme/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CustomButton({Key? key, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: AppColors.white,
        backgroundColor: onTap == null
            ? Theme.of(context).disabledColor
            : Theme.of(context).primaryColor,
        minimumSize: Size(double.infinity, 55),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppStyle.radius)),
        ),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: AppStyle.buttonStyle,
      ),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  const BackButtonWidget({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap ?? Navigator.of(context).maybePop,
        borderRadius: AppStyle.borderRadius,
        child: Icon(CupertinoIcons.back));
  }
}
