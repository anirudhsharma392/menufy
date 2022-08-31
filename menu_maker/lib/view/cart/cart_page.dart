import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_maker/theme/theme.dart';
import 'package:menu_maker/utils/images.dart';
import 'package:menu_maker/view/add_number_sheet/add_number_sheet.dart';
import 'package:menu_maker/widgets/buttons.dart';
import 'package:menu_maker/widgets/common.dart';

class CartPage extends StatelessWidget {
  static const route = '/cart';
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomButton(
        onTap: () => showAddNumberSheet(context),
        leading: "Rs 1234.3",
        trailing: "Place order",
      ),
      body: SafeArea(
        top: true,
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _TitleBar(),
              Space(
                factor: 1.5,
              ),
              for (int i = 0; i < 4; i++) CartItemCard(),
              Padding(padding: AppStyle.padding, child: CustomDivider()),
              PaymentSummary()
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: AppStyle.margin,
              right: AppStyle.margin,
              top: AppStyle.margin,
              bottom: AppStyle.margin / 2),
          child: Text(
            'Payment summary',
            style: AppStyle.headLine1,
          ),
        ),
        CardWrapper(
            child: Column(
          children: [
            PaymentTile(),
            PaymentTile(),
            CustomDivider(),
            Padding(
              padding: EdgeInsets.only(
                  left: AppStyle.margin,
                  top: AppStyle.margin,
                  right: AppStyle.margin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total price',
                    style: AppStyle.headLine2,
                  ),
                  Text(
                    'Rs.1234.3',
                    style: AppStyle.headLine2.copyWith(fontSize: 20),
                  )
                ],
              ),
            ),
          ],
        ))
      ],
    );
  }
}

class PaymentTile extends StatelessWidget {
  final String title;
  final String subTitle;
  const PaymentTile(
      {Key? key, this.title = "Sub total", this.subTitle = "Rs.0"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppStyle.margin,
          bottom: AppStyle.margin,
          right: AppStyle.margin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyle.subtitle1,
          ),
          Text(
            subTitle,
            style: AppStyle.body1,
          )
        ],
      ),
    );
  }
}

class _TitleBar extends StatelessWidget {
  const _TitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomBackButton(),
          Text(
            "Checkout",
            style: AppStyle.headLine1,
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  const CartItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      child: Row(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  Images.veg,
                  height: 20,
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Text(
                    "Big Mac burger",
                    style: AppStyle.subtitle1,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                "Rs. 109",
                style: AppStyle.body1,
              ),
              SizedBox(
                width: AppStyle.margin,
              ),
              AddButton(
                count: 1,
                onAddition: () {},
                onSubtraction: () {},
                isDarkShade: false,
                width: 80,
              )
            ],
          )
        ],
      ),
    );
  }
}
