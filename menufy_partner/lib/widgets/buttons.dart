import 'package:flutter/material.dart';
import 'package:menufy_partner/theme/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: AppColors.white,
        backgroundColor: Theme.of(context).primaryColor,
        minimumSize: Size(double.infinity, 55),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppStyle.radius)),
        ),
      ),
      onPressed: () {},
      child: Text(
        'Login',
        style: AppStyle.headLine2.copyWith(color: AppColors.white),
      ),
    );
  }
}
