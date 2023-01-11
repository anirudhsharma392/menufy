import 'package:flutter/material.dart';
import 'package:menufy_partner/theme/theme.dart';

class CardWrapper extends StatelessWidget {
  final Widget child;
  const CardWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppStyle.radius),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              )
            ]),
        child: child);
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 0,
    );
  }
}

class Space extends StatelessWidget {
  final double? factor;
  final double? height;
  const Space({Key? key, this.factor, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? (16 * (factor ?? 1)),
    );
  }
}

class SpaceSmall extends StatelessWidget {
  final double? factor;
  final double? height;
  const SpaceSmall({Key? key, this.factor, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? (8 * (factor ?? 1)),
    );
  }
}

class SpaceHorizontal extends StatelessWidget {
  final double? width;
  final double factor;

  const SpaceHorizontal({Key? key, this.width, this.factor = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? (16 * factor),
    );
  }
}
